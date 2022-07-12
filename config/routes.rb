Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  namespace :admin do
    resources :articles
  end
  resources :profiles, :only => :index
  get '/contacts', to: 'contacts#index'
end
