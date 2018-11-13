class HomesController < ApplicationController
  # before_action :authenticate_user!


  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end

    @lines = Line.all
  end

  def contact
  end
end
