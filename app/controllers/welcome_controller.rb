class WelcomeController < ApplicationController

  def index
    # If we have a session, dirirect to the dashboard
    if self.current_account
      return redirect_to '/dashboard'
    end

    render :layout => 'special_layout'
  end

end
