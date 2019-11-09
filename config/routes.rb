Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, only: [:create, :new, :edit, :show, :update, :destroy]
  end
end
