class WelcomeController < ApplicationController

  layout 'special_layout'

  def index

    # If we have a session, redirect to the dashboard :)
    if self.current_account

      @page_description = "Connectez-vous à vos amis — et d'autres personnes fascinantes. Recevez des mises à jour instantanées sur les choses qui vous intéressent. Et regardez les événements se dérouler, en temps réel, sous tous les angles."

      return redirect_to '/dashboard'
    end

  end

end
