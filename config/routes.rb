Rails.application.routes.draw do
  root 'emails#index'
  resources :emails

  get "emails/unread/:id", to: "emails#unread", as: "unread"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
