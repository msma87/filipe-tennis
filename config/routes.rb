Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/lessons'
  # get 'pages/contact'

  # Rota do painel administrativo
  namespace :admin do
    root 'dashboard#index'
    resources :posts, :testimonials, :lessons, :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define a página inicial do site
  root 'pages#home'

  # Define rotas para páginas estáticas
  get "/about", to: "pages#about", as: "about"
  get "/lessons", to: "pages#lessons", as: "lessons"
  get "/contact", to: "pages#contact", as: "contact"

  # # Rota para processar o formulário de contato
  # post 'contact', to: 'pages#send_message'

  # Rota para posts
  resources :posts, only: [:index, :show]

end
