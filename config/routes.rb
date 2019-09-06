Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'signup', controller: :signup, action: :create
  post 'signin', controller: :signin, action: :create
  post 'refresh', controller: :refresh, action: :create
end
