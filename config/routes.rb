Rails.application.routes.draw do

  namespace :admin do
    get 'badges/new'
    get 'badges/index'
    get 'badges/create'
    get 'badges/show'
    get 'badges/edit'
    get 'badges/update'
    get 'badges/destroy'
  end
  namespace :admin do
    get 'badges/index'
    get 'badges/show'
    get 'badges/update'
    get 'badges/destroy'
  end
  get 'badges/new'
  get 'badges/index'
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
                               :controllers => {sessions: 'sessions'}

  resources :tests, only: %i[index] do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  
    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index destroy]
    resources :feedbacks, only: %i[index]
  end

  resources :feedbacks, only: %i[new create]

end