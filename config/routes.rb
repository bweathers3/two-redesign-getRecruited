Rails.application.routes.draw do

  resources :athletes do
    resources :sports, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  devise_for :users

  root 'welcome#index'
end
