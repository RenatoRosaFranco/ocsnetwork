Rails.application.routes.draw do
  namespace :dashboard do
    get 'home/index'
  end

  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
