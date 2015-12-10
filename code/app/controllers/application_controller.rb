class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_trends
  helper_method :current_account

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def authorize
    redirect_to '/authentification/connect' unless current_account
  end

  def get_trends
    @trends = Hashtag.order(count: 'desc')
  end

end
