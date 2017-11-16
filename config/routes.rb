Rails.application.routes.draw do
  resources :cocktails do
      resources :doses, only: [ :delete, :new, :create ]
  end
  root to: 'cocktails#index'
end

# GET "cocktails"
# GET "cocktails/42" show
# GET "cocktails/new" new create
# POST "cocktails" show

# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# DELETE "doses/25"
