Boa::Application.routes.draw do
  
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