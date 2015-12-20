class HashtagController < ApplicationController

  before_filter :authorize

  # GET /hashtag/:query
  def index
    @hashtag = params[:query]
    @tweets  = Tweet.search("##{params[:query]}")
    @title = "Tweets with hashtag ##{params[:query]}"
  end

end
