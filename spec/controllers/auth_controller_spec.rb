require 'rails_helper'

RSpec.describe AuthController, :type => :controller do
  render_views

  describe "GET index" do
    it "returns http success" do
      post :login, { :username => 'test', :password => "test" }
      expect(response.body).to include("connect")
    end
  end

end
