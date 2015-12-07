class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?

      tweet = @current_account.tweet.new(tweet_params)

      if tweet.save
        flash[:success] = "You are a PGM"
      else
        flash[:error] = "Please enter a text"
      end

    end

    # Get all tweets
    following_ids = []
    following_ids.push(@current_account.id)

    @current_account.following.each do |account|
      following_ids.push(account.account_id)
    end

    # Pages
    page = if (params[:page]) then params[:page] else 1 end

    @tweets = Tweet.where(account_id: following_ids).order('created_at DESC').page(page).per(20)
  end

  # Private methods
  private
    def tweet_params
      params.require(:tweet).permit(:text)
    end

end
