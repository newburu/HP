Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles
  resources :profiles, :only => :index
  resource :contacts, :only => [:new, :create] do
    post 'confirm', to: 'contacts#confirm', as: 'confirm'
    get 'finish', to: 'contacts#finish', as: 'finish'
  end
end
