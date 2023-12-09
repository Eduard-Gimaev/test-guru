Rails.application.routes.draw do
  get 'gists/new'
  get 'gists/create'
  get 'gists/edit'
  get 'gists/update'
  get 'gists/destroy'
  get 'gists/index'
  get 'gists/show'
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
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end