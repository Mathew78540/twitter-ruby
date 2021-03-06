class AccountController < ApplicationController

  before_filter :authorize

  # GET /account/:username
  def index
    @account = Account.where(username: params[:username]).first

    if @account
      @is_following = Follow.following?(@current_account.id, @account.id)
      @title = "Account @" + params[:username]
    else
      flash[:error] = "This account doesn't exist"
      redirect_to '/dashboard'
      @title = "Welcome on your dashboard"
    end

  end

  # GET /account/:username/edit
  def edit
    @account = @current_account
    @title = "Edit your profile"
  end

  # PATH /account/:username/edit
  def update
    @current_account.update_attributes(update_params)
    redirect_to "/account/#{@current_account.username}/edit"
  end

  # GET /account/:username/following
  def following
    @followings = Account.where({:username => params[:username]}).first.following
    @title = "Your followings"
  end

  # GET /account/:username/followers
  def followers
      @followers = Account.where({:username => params[:username]}).first.follower
      @title = "Your followers"
  end

  # GET /account/:id/follow
  def follow

    if Follow.following?(@current_account.id, params[:id])
      Follow.where({ :follower_id => @current_account.id, :account_id => params[:id] }).destroy_all
    else
      Follow.create({ :follower_id => @current_account.id, :account_id => params[:id] })
    end

    account = Account.find(params[:id])

    redirect_to "/account/#{account.username}"
  end

  private

  def update_params
    params.require(:account).permit(:firstname, :lastname, :avatar)
  end

end
