class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :assign_flash_message, :only => [:create, :update, :destroy]

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  private

  def assign_flash_message
    resource_name = self.class.name.sub(/Controller$/, '').singularize
    action = self.action_name
    @flash_message = t("flash.#{action}", :resource => resource_name)
  end
end
