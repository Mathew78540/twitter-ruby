require 'rails_helper'

RSpec.describe AuthController, :type => :controller do
  render_views

  describe "GET index" do
    it "returns http success when right credentials" do

      # Create a new account
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save

      # Post login to access the dashboard
      post :login, { :username => 'test', :password => "testtest" }

      # Should set the session
      expect(session[:account_id]).to eq(account.id)

      # Should redirect to dashboard
      expect(response.body).to include("redirect")
    end

    it "returns http success when wrong credentials" do

      # Post login with wrong credentials
      post :login, { :username => 'test', :password => "fkzepfezfkezp" }

      # Should redirect to connection view
      expect(response.body).to include("connect")
    end

  end

end
