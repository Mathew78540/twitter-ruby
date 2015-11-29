class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?
      @current_account.tweet.create(tweet_params)
    end

    @tweets = @current_account.tweet
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
