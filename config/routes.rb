Rails.application.routes.draw do
  resources 'books' do
    resources 'copies'
  end

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
