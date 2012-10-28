ShareLinks::Application.routes.draw do
  resources :web_links do
    resources :comments, :only => [:create, :update, :destroy]
    resources :archive_lnks, :only => [:create, :destroy]
  end

  resources :sessions, :only => [:create, :destroy]

  root :to => 'home#index'
end
