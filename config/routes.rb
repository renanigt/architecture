Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :update, :destroy] do
    member do
      put "done"
    end
  end

  resources :grades, only: [:create, :update, :destroy]
end
