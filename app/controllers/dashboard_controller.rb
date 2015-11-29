class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?
      @current_account.tweet.create(tweet_params)
      # TODO Must be create the tweet ...
    end

    @tweets = @current_account.tweet
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
