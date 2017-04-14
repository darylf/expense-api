Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index show]
      resources :expenses
      resources :vendors
    end
  end
end
