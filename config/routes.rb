Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles
  resources :profiles, :only => :index
  resource :contacts, :only => [:new, :create] do
    post 'calendar'
    get 'reservation'
    post 'confirm'
  end
end
