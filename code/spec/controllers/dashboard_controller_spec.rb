require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  render_views

  describe "GET index" do
    it "returns http redirect to login if user is not authenticate" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "returns http success if user is authenticate" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
