Evergreen::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :events, only: [:show]
  root :to => 'welcome#index'
end
