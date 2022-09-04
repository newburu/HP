Rails.application.routes.draw do
  devise_for :accounts, skip:[:registration, :password]
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
  resources :articles, :only => [:index, :show] do
    get  '/articles/:id/archives/:yyyymm', to: 'articles#archives', as: :article_archive
  end
    
end
