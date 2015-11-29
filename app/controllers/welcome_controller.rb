class WelcomeController < ApplicationController

  def index
    # If we have a session, dirirect to the dashboard
    if self.current_account
      redirect_to '/dashboard'
    end
  end

end
