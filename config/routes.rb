Rails.application.routes.draw do
  resources :categories, only: %i[index show]
end
