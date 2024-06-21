Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :tests_users, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create
  resources :feedbacks, only: %i[new create]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :feedbacks, only: %i[index show destroy]
  end
end
