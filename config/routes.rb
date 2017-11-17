Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :cocktails do
      resources :doses, only: [ :delete, :new, :create ]
  end
  root to: 'cocktails#index'

  mount Attachinary::Engine => "/attachinary"

end

# GET "cocktails"
# GET "cocktails/42" show
# GET "cocktails/new" new create
# POST "cocktails" show

# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# DELETE "doses/25"
