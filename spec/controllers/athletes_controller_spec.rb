require 'rails_helper'

RSpec.describe AthletesController, type: :controller do
  let(:this_athlete) { Athlete.create!(firstName: "Billy", middleName: "Bob", lastName: "Smith") }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [this_athlete] to @athletes" do
      get :index
      expect(assigns(:athletes)).to eq([this_athlete])
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
