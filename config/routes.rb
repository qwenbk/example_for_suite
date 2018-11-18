Rails.application.routes.draw do

  resources :sourses
  resources :reasons
  resources :lines do
    member do
      get :my_edit
    end
    collection do
      get :my_show
      get :my2_show
    end
  end
  resources :sections
  resources :tasks
  resources :role_users
  resources :roles
  resources :filials
  resources :users do
    collection do
      get :change
    end
  end

  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'cmon_let_me_in' }

  root to: "homes#index"
  get 'contact', action: :contact, controller: 'homes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
