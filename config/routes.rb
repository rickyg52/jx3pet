Rails.application.routes.draw do
  devise_for :users

  # # Devise routes should appear before general routes
  # devise_for :users,
  #            controllers: {
  #              registrations: 'authentication/registrations',
  #              sessions: 'authentication/sessions',
  #              confirmations: 'authentication/confirmations',
  #              passwords: 'authentication/passwords' },
  #            skip: :invitations

  resources :users, only: [] do
    collection do
      get :signed_in
      patch :update_password
    end
  end

  namespace :api do
    scope module: :v1, constraints: Mjolnir::Api::ApiConstraints.new(version: 1, default: :true) do
      resources :pets, only: [:create, :index, :update, :show] do
        resources :pet_aliases, module: :pets, only: [:create, :index, :update, :destroy, :show] do
          resources :pet_serendipities, module: :pet_aliases, only: [:create, :index, :update, :destroy] 
        end
      end
      resources :servers, only: [:index, :show] do
        collection do
          put :show_by_name
        end
        resources :groups, module: :servers, only: [:create, :index, :update, :destroy, :show]
      end
      resources :serendipities, only: [:index]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
end
