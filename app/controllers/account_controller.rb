class AccountController < ApplicationController

  before_filter :authorize

  # GET /account/:username
  def index
    @account = Account.where(username: params[:username]).first
  end

  # GET /account/:id/follow
  def follow

    follow = Follow.where({ :follower_id => @current_account.id, :account_id => params[:id] })

    if follow.present?
      follow.destroy_all
    else
      Follow.create({ :follower_id => @current_account.id, :account_id => params[:id] })
    end

    redirect_to '/dashboard'
  end

end
