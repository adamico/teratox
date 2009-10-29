class HomeController < ApplicationController
  def index
    flash[:notice] = t(:hello_flash)
  end

end
