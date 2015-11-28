class AuthentificationController < ApplicationController

  # GET /authentification/connect
  def connect
  end

  # POST /authentification/connect
  def login

    if params[:account][:username].present? && params[:account][:password].present?
      account = Account.find_by(username: params[:account][:username]).try(:authenticate, params[:account][:password])

      if account
        session[:user_id] = account.id
        @notice = "Login successful"
        # TODO Create session and redirect to the home page :)
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
      # TODO Create session and redirect to the home page :)
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
