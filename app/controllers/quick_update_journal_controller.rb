require 'json'

class QuickUpdateJournalController < ApplicationController
  unloadable

  before_filter :find_issue

  helper :issues

  def configs(state)
    file = File.read(Rails.root.to_s + '/plugins/redmine_quick_button_issue/assets/rules/rule_' + state + '.map')
    return JSON.parse(file)
  end

=begin
  TODO list
    rule of approval!
    1. Project & Tracker is defined (it is related with what workflow will be used, and what kind of issue that approval button will show), default will all project + all tracker
    2. issue status is not the last index of workflow
    3. issue status can be excluded for specific condition, but is set none for default
    4. approval process is about change the task status from current status to the next status of workflow
    5. end of approval process will make changes for issue

    Pseudocode:
    projects = @configs[:projects].key
    trackers =

    if @config[:projects].include?(@issue.project) &&
          @issue.tracker == @configs
=end
  def approve
    user = User.current
    assigned_was = @issue.assigned_to
    assigned_new = params[:assigned_to_id]
    status_was = @issue.status
    status_next_available = @issue.new_statuses_allowed_to(User.current)
    notes = params[:notes]

    @configs = configs('approve')
    # Rails.logger.info "Rules of Approval: \n" + @configs.to_s
    @issue.assigned_to_id
  end


=begin
    TODO list
    rule of reject!
    1. Project & Tracker is defined but this followed by approval rule no.1
    2. issue status is not the last index of workflow
    3. issue status can be excluded for specific condition, but is set none for default
    4. issue status for state of rejection must be defined, is should be String and part of last index of workflow. the default will set to any last index of workflow
    5. if next issue status is doesn't have the specific reject status defined, the reject button also should hide
    6. approval process is about change the task status from current status to the last status of workflow
    7. end of reject process will make changes for issue.
=end
  def reject
  end


=begin
    TODO list
    rule of assign_to!
    1. button assign to is should be showing in any state of issue status
    2. assign_to process is may have for any optional rule expression that can configure from plugin configuration, e.g:
      a. change status to "specific_status"
      b. change value of "some_of_specific_attributes_of_issue"
      c. make note is "required" or "optional"
      d. modify any issue variables
=end
  def assign_to
    @issue.assigned_to_id = params[:issue_assigned_to]
    Rails.logger.info "ini issue # \n" + @issue.to_h.to_s
  end

  # UNUSED YET
  # def change_mode
  # end

  # UNUSED YET
  # def start
  # end

  # UNUSED YET
  # def pause
  # end

  # UNUSED YET
  # def finish
  # end

  # UNUSED YET
  # def decline
  # end

  def popup
    respond_to do |format|
      format.js
    end
  end

  ################################################################
  # Below of this comment is used for private method
  ################################################################
  private

  def find_issue
    @issue = Issue.find(params[:task_id])
    raise Unauthorized unless @issue.visible?
    @project = @issue.project

    user_real = User.current
    @status_allowed = @issue.new_statuses_allowed_to(user_real)
    @allowed_approved_status = @status_allowed.select {|status| status[:default_done_ratio] >= 0 && status[:default_done_ratio] < 100 && !status[:name].eql?(@issue.status.to_s) }
    @allowed_rejected_status = @status_allowed.select {|status| status[:is_closed] }

  rescue ActiveRecord::RecordNotFound
    render_404
  end
end