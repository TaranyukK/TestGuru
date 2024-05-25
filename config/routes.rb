Rails.application.routes.draw do
  root 'tests#index'

  resources :tests, except: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
end
