Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
                               :controllers => {sessions: 'sessions'}

  resources :users do
    resources :badges, only: %i[index show]
    resources :user_badges, only: %i[index]
  end

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

  resources :feedbacks, only: %i[new create]
  resources :badges, only: %i[index show]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index destroy]
    resources :feedbacks, only: %i[index]
    resources :badges
    resources :user_badges, only: %i[index]
  end
end