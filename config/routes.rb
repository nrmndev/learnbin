Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/topics", to: redirect("/dashboard/topics")
  # get "/topics/:id", to: redirect("/dashboard/topics/:id")
  # get "/posts", to: redirect("/dashboard/posts")
  # get "/posts/:id", to: redirect("/dashboard/posts/:id")
  # get "/parts", to: redirect("/dashboard/parts")
  # get "/parts/:id", to: redirect("/dashboard/parts/:id")


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :categories do
    # resources :topics
  end


  resources :posts do
    resources :parts
  end


  resources :discover do
    resources :topics do
      resources :posts do
        resources :parts do
        end
      end
    end
  end

  namespace :dashboard do
    resources :collections do
      resources :collection_topics do
        member do
          patch :move_up
          patch :move_down
        end
      end
    end

    resources :topics do
      resources :topic_posts do
        member do
          patch :move_up
          patch :move_down
        end
      end
    end

    resources :posts do
      resources :parts do
        member do
          patch :move_up
          patch :move_down
        end
      end
    end

    resources :profile, only: [:index]
    resources :usage, only: [:index]
    resources :settings, only: [:index]
    resources :activity, only: [:index]
    resources :archives, only: [:index]

    # this gives: GET /dashboard/topics → dashboard/topics#index
    # and the rest of CRUD: show, new, edit, update, destroy
  end

  # get "dashboard/activity", to: "dashboard#activity", as: :dashboard_activity
  # get "dashboard/archives", to: "dashboard#archives", as: :dashboard_archives
  # get "dashboard/profile", to: "dashboard#profile", as: :dashboard_profile

  # resources :topics do
  #   member do
  #     get :articles
  #   end
  # end
  # resources :topics do
  #   resources :posts do
  #     resources :parts do
  #     end
  #   end
  # end

  get '/:username', to: 'users#index', as: :user
  namespace :api do
    get 'knowledge_base/index'
    get 'knowledge_base', to: 'knowledge_base#index'
    #resources :categories, only: [:index, :create]
  end
end
