require 'redmine'
require_dependency 'quick_button/hook/quick_button_hook_listener'

QUICK_BUTTON_VERSION_NUMBER = '0.1.0'
QUICK_BUTTON_VERSION_TYPE = "Initial version"

Redmine::Plugin.register :redmine_quick_button_issue do
  name 'Redmine Quick Button Issue plugin'
  author 'Muhammad Taqwim'
  description 'This is a plugin for Redmine'
  version QUICK_BUTTON_VERSION_NUMBER
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {'empty' => true}, :partial => 'settings/quick_button/general'

  permission :approve_task, { :quick_update_journal => [:popup] }
  permission :reject_task, { :quick_update_journal => [:popup] }
  permission :reassign_task, { :quick_update_journal => [:popup] }
end