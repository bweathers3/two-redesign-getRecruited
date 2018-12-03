Rails.application.routes.draw do

  resources :athletes do
    resources :sports, except: [:index]
  end

  resources :athletes do
    resources :myteams
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

    member { get :index_schools }
    member { get :edit_schools }
    member { put :update_schools }

    # resources :myteams do
    #   collection { get :edit_schools }
    # end

    # resources :myteams do
    #   collection { patch :update_schools }
    # end
    #resources :myprogram
  end

  # resources :myteams do
  #   collection { patch :update_schools }
  # end

  get 'programs/index'
  get 'programs/import'
  #get 'myteams/setUpTeams'

  resources :programs do
  	collection { post :import}
  end

  # resources :programs do
  #   resources :myprogram
  # end



  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'faq' => 'welcome#faq'

  devise_for :users

  root 'welcome#index'
end
