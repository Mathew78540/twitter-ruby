class AuthController < ApplicationController

  layout 'special_layout'

  # POST /auth/connect
  def login

    username = params[:username]
    password = params[:password]

    if username.present? && password.present?
      account = Account.find_by(username: username).try(:authenticate, password)

      if account
        session[:account_id] = account.id
        return redirect_to '/dashboard'
      end
    end

    render '/welcome/index'

  end

  # POST /auth/subscribe
  def create

    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      return redirect_to '/dashboard'
    end

    render '/welcome/index'

  end

  # GET /auth/logout
  def logout
    session[:account_id] = nil
    redirect_to '/'
  end

  private
  def account_params
    params.permit(:username, :password, :password_confirmation, :firstname, :lastname)
  end

end
