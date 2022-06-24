Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles
  resources :profiles, :only => :index
  resource :contacts, :only => [:new, :create] do
    post 'calendar', to: 'contacts#calendar', as: 'calendar'
    match 'reservation', to: 'contacts#reservation', as: 'reservation', via: [:get, :post] #@TODO 開発終了時はpostのみにする
    match 'confirm', to: 'contacts#confirm', as: 'confirm', via: [:get, :post] #@TODO 開発終了時はpostのみにする
    get 'finish', to: 'contacts#finish', as: 'finish'
  end
end
