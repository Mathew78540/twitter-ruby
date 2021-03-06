class SearchController < ApplicationController

  before_filter :authorize

  # GET /search/:query
  def index
    @tweets   = Tweet.search(params[:query])
    @accounts = Account.search(params[:query])
    @title = "Results for #{params[:query]}"
  end

end
