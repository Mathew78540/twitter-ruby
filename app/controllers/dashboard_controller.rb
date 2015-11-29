class DashboardController < ApplicationController

  before_filter :authorize

  # GET|POST /dashboard
  def index
    if request.post?
      # TODO Must be create the tweet ...
    end
  end

end
