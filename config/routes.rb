Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'about#about'
  get '/about/author', to: 'about#about_author'
end
