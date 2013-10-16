Boa::Application.routes.draw do

  resources :task_categories


  resources :contact_lists


  resources :charges
  resources :checkouts
  resources :contact_lists
  resources :diagrams
  resources :faqs
  resources :memberships
  resources :organizations
  resources :participants
  resources :shift_participants
  resources :shifts
  resources :tasks
  resources :tools

  match "checkout_tool/:id" => "tools#checkout", :as => :checkout_tool
  match "checkin_tool/:id" => "tools#checkin", :as => :checkin_tool

  match "clock_in_shift/:id" => "shift_participants#clock_in", :as => :clock_in_shift
  match "clock_out_shift/:id" => "shift_participants#clock_out", :as => :clock_out_shift

  match "new_tool_checkout" => "checkouts#new_tool_checkout", :as => :new_tool_checkout
  match "create_tool_checkout" => "checkouts#create_tool_checkout", :as => :create_tool_checkout

  match "new_participant_membership" => "memberships#new_participant_membership", :as => :new_participant_membership
  match "create_participant_membership" => "memberships#create_participant_membership", :as => :create_participant_membership


  match "old_faq" => "home#faq", :as => "old_faq"
  match "phonenumbers" => "home#phone_numbers", :as => "phonenumbers"
  match "contacts" => "home#contact_list", :as => "contacts"
  match "milestones" => "home#milestones", :as => "milestones"
  match "esp" => "home#esp", :as => "esp"

  authenticated :user do
    root :to => 'home#index'
  end


  root :to => "home#index"

  devise_for :users
  resources :users
end