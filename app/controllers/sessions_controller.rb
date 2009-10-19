class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.create!(params[:user])
    flash[:notice] = "Utilisateur connecté avec succès."
    redirect_to '/'
  end

end
