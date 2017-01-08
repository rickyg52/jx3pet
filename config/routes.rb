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
      #resources :pets, only: [:create, :update, :show]
      resources :servers, only: [:index, :show] do
        collection do
          put :show_by_name
        end

        member do
          put :last_triggers
          get :all_in_cd
          get :all_aliases
        end
        resources :pets, module: :servers, only: [:show]
        resources :pet_aliases, module: :servers, only: [:create, :index, :update] do
          member do
            put :previous_cd
            get :status
          end
          resources :pet_serendipities, module: :pet_aliases, only: [:create] do
          end
        end
      end
      resources :groups, only: [:create, :index, :update, :destroy, :show] do
        member do
          get :format
        end
      end 
      resources :serendipities, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
end
