Rails.application.routes.draw do
  devise_for :users
  resources "books" do
    resources "copies", shallow: true
  end

  post "/copies/:id/checkout" => "copies#checkout"
  post "/copies/:id/return" => "copies#return"

  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
