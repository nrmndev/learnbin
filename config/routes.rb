Rails.application.routes.draw do
  devise_for :users

  get 'articles/index'
  get 'articles/show'
  get 'articles/new'
  get 'articles/edit'
  get 'topics/index'
  get 'topics/show'
  get 'topics/new'
  get 'topics/edit'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/edit'

 get '/dashboard', to: 'dashboard#index', as: :dashboard
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :categories do
    resources :topics
  end

  resources :topics do
    resources :posts do
      resources :parts
    end
  end

  resources :discover do
    resources :categories do
      resources :topics do
        resources :posts do
          resources :parts do
          end
        end
      end
    end
  end

  namespace :dashboard do

      resources :topics do
        resources :posts do
          resources :parts do
            member do
              patch :move_up
              patch :move_down
            end
          end
        end
      end


    # this gives: GET /dashboard/topics → dashboard/topics#index
    # and the rest of CRUD: show, new, edit, update, destroy
  end

  # resources :topics do
  #   member do
  #     get :articles
  #   end
  # end

  namespace :api do
    get 'knowledge_base/index'
    get 'knowledge_base', to: 'knowledge_base#index'
    #resources :categories, only: [:index, :create]
  end
end
