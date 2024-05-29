Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: :create

  resources :tests, except: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :tests_users, only: %i[show update] do
    get :result, on: :member
  end
end
