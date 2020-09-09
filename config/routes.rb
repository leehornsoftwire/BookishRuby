Rails.application.routes.draw do
  get 'books/index'
  resources 'books' do
    resources 'copies'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
