# config/routes.rb
Rails.application.routes.draw do
  resources :categories do
    resources :tasks, only: [:index, :create]
  end

  resources :tasks, except: [:index, :create] do
    member do
      get 'complete'
    end
  end

  root 'categories#index'
end
