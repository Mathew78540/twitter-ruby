class AuthentificationController < ApplicationController

  # GET /authentification/connect
  def connect
  end

  # POST /authentification/connect
  def login
  end

  # GET /authentification/subscribe
  def subscribe
    @account = Account.new()
  end

  # POST /authentification/subscribe
  def create
    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      @notice = "Account created"
    end

    # TODO Create session and redirect to the home page :)
    render 'subscribe'
  end

  private
  def account_params
    params.require(:account).permit(:username, :password, :password_confirmation, :firstname, :lastname)
  end

end
