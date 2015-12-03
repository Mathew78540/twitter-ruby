class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?
      @current_account.tweet.create(tweet_params)
    end

    # TODO Get all tweets from followers
    @tweets = @current_account.tweet.order('created_at DESC')
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
