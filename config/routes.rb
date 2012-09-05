Evergreen::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :events, only: [:show]
  resources :tweets, only: [:index]
  root :to => 'welcome#index'
end
