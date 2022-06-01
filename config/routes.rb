Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles
  resources :profiles, :only => :index
  get '/contacts', to: 'contacts#index'
  root to: 'home#index'
end
