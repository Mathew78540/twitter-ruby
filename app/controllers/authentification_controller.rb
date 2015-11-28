class AuthentificationController < ApplicationController

  # GET /authentification/connect
  def connect
  end

  # POST /authentification/connect
  def login

    username = params[:account][:username]
    password = params[:account][:password]

    if username.present? && password.present?
      account = Account.find_by(username: username).try(:authenticate, password)

      if account
        session[:account_id] = account.id
        @notice = "Login successful"
        # TODO Redirect to the home page :)
      else
        @notice = "We don't have account with this username and password"
      end
    end

    render 'connect'
  end

  # GET /authentification/subscribe
  def subscribe
  end

  # POST /authentification/subscribe
  def create
    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      @notice = "Account created"
      # TODO Redirect to the home page :)
    end

    render 'subscribe'
  end

  # GET /authentification/logout
  def logout
    session[:account_id] = nil
    redirect_to '/'
  end

  private
  def account_params
    params.require(:account).permit(:username, :password, :password_confirmation, :firstname, :lastname)
  end

end
