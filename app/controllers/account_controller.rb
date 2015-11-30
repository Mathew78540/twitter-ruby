class AccountController < ApplicationController

  # GET /account/:username
  def index
    @account = Account.where(username: params[:username]).first
  end

end
