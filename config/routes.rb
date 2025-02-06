Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  get 'pages/lessons'
  get 'pages/contact'

  # Rota do painel administrativo
  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :posts, :testimonials, :lessons
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define a página inicial do site
  root 'pages#home'

  # Define rotas para páginas estáticas
  get 'about', to: 'pages#about'
  get 'lessons', to: 'pages#lessons'
  get 'contact', to: 'pages#contact'

  # # Rota para processar o formulário de contato
  # post 'contact', to: 'pages#send_message'

  # Rota para posts
  resources :posts, only: [:index, :show]

end
