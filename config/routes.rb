Rails.application.routes.draw do

  resources :athletes do
    resources :sports, except: [:index]
  end

  resources :athletes do
    #resources :myteams
    #resources :academic
    # resources :address
    # resources :contact
    # resources :counselor_contact
    # resources :current_address
    # resources :father_address
    # resources :father_contact
    # resources :mother_address
    # resources :mother_contact
    # resources :school_address
    # resources :sibling
  end

  resources :sports do
    resources :diving, :swimming, :waterpolo

    get 'index_schools', on: :member
    get 'edit_schools', on: :member
    patch 'update_schools', on: :collection

    get 'index_myprograms', on: :member
    get 'edit_myprograms', on: :member

    put 'check_all_divisions', on: :member
    # put 'check_all_division1', on: :member
    # put 'check_all_division2', on: :member
    # put 'check_all_division3', on: :member
    # put 'check_all_naia', on: :member
    # put 'check_all_juniorcollege', on: :member
    # put 'check_all_schools', on: :member
    put 'uncheck_all_schools', on: :member

  end




  get 'programs/index'
  get 'programs/import'


  resources :programs do
  	collection { post :import}
  end

  resources :myprograms do
    patch 'update_myprograms', on: :collection
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  devise_for :users

  root 'welcome#index'
end
