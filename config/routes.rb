Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, except: :index, path: '/' do
    member do
      post 'toggle_status'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
