class HomeController < ApplicationController
  def index
    params[:search] ||= {}
  end
end
