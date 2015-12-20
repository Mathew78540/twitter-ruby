require 'rails_helper'

RSpec.describe AccountController, :type => :controller do
  render_views

  describe "GET index" do
    it "should return an error when an account doesn't exist" do
      # Login
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save
      session[:account_id] = account.id

      # Test
      get :index, { :username => "unknown"}
      expect(flash[:error]).to include("This account doesn't exist")
    end

    it "should show an account when i'm logged and the account exist" do
      # Login
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save
      session[:account_id] = account.id

      # Test
      get :index, { :username => "test"}
      expect(response.body).to include("follow")
    end
  end

end
