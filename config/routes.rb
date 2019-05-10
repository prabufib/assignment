Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    get :login,on: :collection
    get :get_follows, on: :collection
  end
  resources :answers
  resources :questions
  resources :questionnaires
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match "/questionnaire/:questionnaire_id/user_id/:current_user_id/follow", :controller => "home", :action => "follow_questionnaire", :via => [:get]
  match "/user_id/:user_id/follows", :controller => "home", :action => "get_follows", :via => [:get], :as => :get_follows_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#home" 
end
