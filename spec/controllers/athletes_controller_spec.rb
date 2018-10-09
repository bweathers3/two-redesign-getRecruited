require 'rails_helper'

RSpec.describe AthletesController, :type => :controller do
  let(:user) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }

  let(:this_athlete) { Athlete.create!(firstName: Faker::Name.first_name, middleName: Faker::Name.first_name,
      lastName: Faker::Name.unique.last_name, user: user) }

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns [this_athlete] to @athletes" do
      get :index
      expect(assigns(:athletes)).to eq([this_athlete])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @athlete" do
      get :new
      expect(assigns(:athlete)).not_to be_nil
    end
  end

  describe "Athlete create" do
    it "increases the number of Ahlete by 1" do
      expect{ post :create, params: { athlete: { firstName: Faker::Name.first_name, middleName: Faker::Name.first_name,
          lastName: Faker::Name.unique.last_name, user: user } } }.to change(Athlete,:count).by(1)
    end

    it "assigns the new athlete to @athlete" do
      post :create, params: { athlete: { firstName: Faker::Name.first_name, middleName: Faker::Name.first_name,
        lastName: Faker::Name.unique.last_name, user: user } }
      expect(assigns(:athlete)).to eq Athlete.last
    end

    it "redirects to the new athlete" do
      post :create, params: { athlete: { firstName: Faker::Name.first_name, middleName: Faker::Name.first_name,
        lastName: Faker::Name.unique.last_name, user: user } }
      expect(response).to redirect_to Athlete.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: this_athlete.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: this_athlete.id}
      expect(response).to render_template :show
    end

    it "assigns this_athlete to @athlete" do
      get :show, params: {id: this_athlete.id}
      expect(assigns(:athlete)).to eq(this_athlete)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: this_athlete.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {id: this_athlete.id}
      expect(response).to render_template :edit
    end

    it "assigns athlete to be updated to @athlete" do
      get :edit, params: {id: this_athlete.id}
      athlete_instance = assigns(:athlete)
      expect(athlete_instance.id).to eq this_athlete.id
      expect(athlete_instance.firstName).to eq this_athlete.firstName
      expect(athlete_instance.middleName).to eq this_athlete.middleName
      expect(athlete_instance.lastName).to eq this_athlete.lastName
    end
  end

  describe "PUT update" do
    it "updates athlete with expected attributes" do
      new_firstName = Faker::Name.first_name
      new_middleName = Faker::Name.first_name
      new_lastName = Faker::Name.unique.last_name

      put :update,  params: { id: this_athlete.id, athlete: { firstName: new_firstName, middleName: new_middleName, lastName: new_lastName }}
      updated_athlete = assigns(:athlete)
      expect(updated_athlete.id).to eq this_athlete.id
      expect(updated_athlete.firstName).to eq new_firstName
      expect(updated_athlete.middleName).to eq new_middleName
      expect(updated_athlete.lastName).to eq new_lastName
    end

    it "redirects to the updated post" do
      new_firstName = Faker::Name.first_name
      new_middleName = Faker::Name.first_name
      new_lastName = Faker::Name.unique.last_name
      put :update,  params: { id: this_athlete.id, athlete: { firstName: new_firstName, middleName: new_middleName, lastName: new_lastName }}
      expect(response).to redirect_to this_athlete
    end
  end

  describe "DELETE destroy" do
    it "deletes the athlete" do
      delete :destroy, params: { id: this_athlete.id }
      count = Athlete.where({id: this_athlete.id}).size
      expect(count).to eq 0
    end

    it "redirects to athletes index" do
      delete :destroy, params: {id: this_athlete.id}
      expect(response).to redirect_to athletes_path
    end
  end
end
