ShareLinks::Application.routes.draw do
  resources :web_links do
    resources :comments, :only => [:create, :update, :destroy]
    resources :archive_links, :only => [:create, :destroy]
    collection do
      get :archived
    end
  end

  match '/sessions' => 'sessions#create', as: :sessions
  match '/logout' => 'sessions#destroy', as: :logout

  match '/style-guide' => 'home#style_guide'

  root :to => 'home#index'
end
