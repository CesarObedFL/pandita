Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'api/v1/users#create'
  end
  
  namespace 'api' do
    namespace 'v1' do
      resources :users, :only => [:index, :show, :create, :update, :destroy]      # route /api/v1/users
      resources :movements, :only => [:index, :show, :create]                     # route /api/v1/movements
    end
  end
end
