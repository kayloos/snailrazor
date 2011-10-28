Snailrazor::Application.routes.draw do

  devise_for :users

  resources :comments

  resources :posts do
    collection do
      post :preview
    end
  end

  resource :pages do
    member do
      get :welcome
    end
  end

  root :to => 'posts#index'
end
