Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  namespace :admin do
    resources :articles
  end
  resources :profiles, :only => :index
  resource :contacts, :only => [:new, :create] do
    match 'calendar', to: 'contacts#calendar', as: 'calendar', via: [:get, :post]
    get 'reservation'
    post 'confirm'
    get 'finish'
  end
end
