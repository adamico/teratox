class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username_and_password(params[:username], params[:password])
    if @user
      flash[:notice] = "Utilisateur connecté avec succès."
      redirect_to '/'
    else
      flash[:notice] = "Utilisateur ou mot de passe incorrect."
      render :action => "new"
    end
  end

end
