Rails.application.routes.draw do
    resources :projects do
      member do
        put "done"
      end
    end

    resources :grades
end
