class AccountController < ApplicationController

  before_filter :authorize

  # GET /account/:username
  def index
    @account      = Account.where(username: params[:username]).first
    @is_following = Follow.following?(@current_account.id, @account.id)
  end

  # GET /account/:id/follow
  def follow

    if Follow.following?(@current_account.id, params[:id])
      Follow.where({ :follower_id => @current_account.id, :account_id => params[:id] }).destroy_all
    else
      Follow.create({ :follower_id => @current_account.id, :account_id => params[:id] })
    end

    redirect_to '/dashboard'
  end

end
