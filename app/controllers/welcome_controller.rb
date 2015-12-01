class WelcomeController < ApplicationController

  layout 'special_layout'
  
  def index

    # If we have a session, redirect to the dashboard :)
    if self.current_account
      return redirect_to '/dashboard'
    end

  end

end
