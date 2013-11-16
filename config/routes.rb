Boa::Application.routes.draw do

  resources :task_categories
  resources :contact_lists
  resources :charges
  resources :checkouts
  resources :contact_lists
  resources :documents
  resources :faqs
  resources :memberships
  resources :organizations
  resources :participants
  resources :shift_participants
  resources :shifts
  resources :tasks
  resources :tools

  # match "checkout_tool/:id" => "tools#checkout", :as => :checkout_tool
  # match "checkin_tool/:id" => "tools#checkin", :as => :checkin_tool

  # shift clock in / clock out
  match "new_shift_clock_in/:id" => "shift_participants#new_shift_clock_in", :as => :new_shift_clock_in
  match "create_shift_clock_in" => "shift_participants#create_shift_clock_in", :as => :create_shift_clock_in
  match "new_shift_clock_out/:id" => "shift_participants#new_shift_clock_out", :as => :new_shift_clock_out
  match "create_shift_clock_out" => "shift_participants#create_shift_clock_out", :as => :create_shift_clock_out

  # tool check in / check out
  match "new_tool_checkout" => "checkouts#new_tool_checkout", :as => :new_tool_checkout
  match "new_tool_checkout/:tool_id" => "checkouts#new_tool_checkout", :as => :new_tool_checkout_given_tool
  match "create_tool_checkout" => "checkouts#create_tool_checkout", :as => :create_tool_checkout
  match "new_tool_checkin/:tool_id" => "checkouts#new_tool_checkin", :as => :new_tool_checkin_given_tool
  match "new_tool_checkout" => "checkouts#new_tool_checkout", :as => :new_tool_checkout
  match "create_tool_checkin" => "checkouts#create_tool_checkin", :as => :create_tool_checkin

  # user creation
  match "new_user_and_participant" => "participants#new_user_and_participant", :as => :new_user_and_participant
  match "create_participant_user" => "checkouts#create_tool_checkin", :as => :create_tool_checkin
  match "add_participant_memberships" => "memberships#add_participant_memberships", :as => :add_participant_memberships
  match "create_participant_memberships" => "memberships#create_participant_memberships", :as => :create_participant_memberships

  match "new_participant_membership" => "memberships#new_participant_membership", :as => :new_participant_membership
  match "create_participant_membership" => "memberships#create_participant_membership", :as => :create_participant_membership

  match "new_organization_alias/:id" => "organization_aliases#new_alias", :as => :new_organization_alias
  match "create_organization_alias" => "organization_aliases#create_alias", :as => :create_organization_alias
  match "remove_organization_alias/:id" => "organization_aliases#destroy_alias", :as => :remove_organization_alias

  match "milestones" => "home#milestones", :as => "milestones"
  match "esp" => "home#esp", :as => "esp"

  match "search" => "home#search", :as => "search"
  match "home" => "home#home", :as => "home"

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :users
end