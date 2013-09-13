Boa::Application.routes.draw do
  
  resources :faqs
  
  resources :tools
  resources :tasks
  resources :shifts
  resources :shift_participants
  resources :participants
  resources :organizations
  resources :memberships
  resources :checkouts
  resources :charges
  resources :diagrams

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