Packman::Application.routes.draw do

  resources :orders, only: [:new, :create]

  resources :boxes

  resources :products do
    collection do
      get 'typeahead'
    end
  end

  get "welcome/index"

  root 'welcome#index'

end
