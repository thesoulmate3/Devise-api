Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Creates a new user
      post 'signup', to: 'users/registrations#create'
      post 'verify', to: 'users/registrations#verify'
    end
  end
end
