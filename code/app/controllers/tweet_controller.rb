class TweetController < ApplicationController

  before_filter :authorize

  # GET /tweet/:id/like
  def like

    like = Like.where({ :account_id => @current_account.id, :tweet_id => params[:id] })

    if like.blank?
      Like.create({ :account_id => @current_account.id, :tweet_id => params[:id] })
    else
      Like.where({ :account_id => @current_account.id, :tweet_id => params[:id] }).destroy_all
    end

    render :json => like.count
  end

end
