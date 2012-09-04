Evergreen::Application.routes.draw do
  resources :events, only: [:show]
  root :to => 'welcome#index'
end
