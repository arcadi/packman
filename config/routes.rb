Packman::Application.routes.draw do

  resources :orders, only: [:new, :create]

  resources :boxes

  resources :products do
    collection do
      get 'typeahead'
    end
  end

  namespace :api do
    resource :version, only: [:show]

    namespace :v1 do
      resources :boxes, except: [:edit, :new]
      resources :products, except: [:edit, :new]
    end

  end

  get "welcome/index"

  root 'welcome#index'

end
