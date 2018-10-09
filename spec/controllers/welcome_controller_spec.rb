require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { User.create!(
    firstName:    Faker::Name.first_name, lastName:     Faker::Name.unique.last_name,
    email:        'rspecTest1@gmail.com', password:     'helloworld' ) }

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET contact" do
    it "renders the contact template" do
      get :contact
      expect(response).to render_template("contact")
    end
  end

  describe "GET faq" do
    it "renders the faq template" do
      get :faq
      expect(response).to render_template("faq")
    end
  end

end
