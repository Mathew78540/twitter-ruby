class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?
      @current_account.tweet.create(tweet_params)
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

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

end
