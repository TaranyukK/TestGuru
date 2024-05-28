Rails.application.routes.draw do
  root 'tests#index'

  resources :tests, except: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :tests_users, only: %i[show update] do
    member do
      get :result
    end
  end
end
