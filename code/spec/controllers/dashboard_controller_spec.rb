require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  render_views

  describe "GET index" do
    it "returns http redirect to login if user is not authenticate" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "returns http success if user is authenticate" do
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save
      session[:account_id] = account.id
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST index" do
    it "should fails when a tweet is over 140 caracters" do
      # Connection
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save
      session[:account_id] = account.id

      # Test
      post :index,  :tweet => { :text => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'}
      expect(flash[:error]).to eq("Your tweet should be max 140 caracters")
    end

    it "should creat a tweet when is lesst than 140 caracters" do

      # Connection
      account = Account.new({:username =>  "test", :password => "testtest", :password_confirmation => "testtest", :firstname => "arthur", :lastname => "mialon"})
      account.save
      session[:account_id] = account.id

      before = Tweet.count

      # Test
      post :index,  :tweet => { :text => 'My little tweet #UnitTest'}

      after = Tweet.count - 1
      expect(after).to eq(before)
    end
  end
end
