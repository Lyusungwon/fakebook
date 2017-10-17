Rails.application.routes.draw do
  
  match ":controller(/:action(/:id))", :via => [:post, :get, :delete]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "newsfeed#index"
  
end
