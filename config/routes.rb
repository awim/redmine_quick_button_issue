# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :issues do
  get 'approve', :to => 'quick_update_journal#approve'
  get 'reject', :to => 'quick_update_journal#reject'
  get 'assign_to', :to => 'quick_update_journal#assign_to'
  get 'chmod', :to => 'quick_update_journal#change_mode'
  get 'start', :to => 'quick_update_journal#start'
  get 'pause', :to => 'quick_update_journal#pause'
  get 'finish', :to => 'quick_update_journal#finish'
end

  get 'quick/popup', :to => 'quick_update_journal#popup', :as => 'quick_popup'

  # post 'issues/:task_id/quick/approve', :to => 'quick_update_journal#approve' #for API Later
  post 'quick/approve', :to => 'quick_update_journal#approve', :as => 'quick_approve'
  post 'quick/reject', :to => 'quick_update_journal#reject', :as => 'quick_reject'
  post 'quick/assign_to', :to => 'quick_update_journal#assign_to', :as => 'quick_assign_to'