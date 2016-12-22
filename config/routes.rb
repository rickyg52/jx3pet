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
      resource :pets, only: [:create, :index, :update, :show] do
        resource :pet_aliases, module: :pets, only: [:create, :index, :update, :destroy, :show] do
          resource :pet_serendipities, module: :pet_aliases, only: [:create, :index, :update, :destroy] 
        end
      end
      resource :servers, only: [:index, :show] do
        resource :groups, module: :servers, only: [:create, :index, :update, :destroy, :show]
      end
      resource :serendipities, only: [:index]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
end
