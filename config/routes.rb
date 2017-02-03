Rails.application.routes.draw do

  scope "api" do
    resources :projects do
      member do
        put "done"
      end
    end

    resources :grades
  end
  
end
