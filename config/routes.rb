Rails.application.routes.draw do
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  devise_for :users


  root 'welcome#index'
end
