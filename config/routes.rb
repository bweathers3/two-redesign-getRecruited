Rails.application.routes.draw do

  resources :athletes do
    resources :sports, except: [:index]
  end

  resources :athletes do
    resources :academic
    resources :address
    resources :contact
    resources :counselor_contact
    resources :current_address
    resources :father_address
    resources :father_contact
    resources :mother_address
    resources :mother_contact
    resources :school_address
    resources :sibling
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  devise_for :users

  root 'welcome#index'
end
