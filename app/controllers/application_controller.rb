class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def redirect_with_flash(instance)
    redirect_to instance, :notice => flash_message(instance)
  end

  private

  def flash_message(instance)
    @flash_message = t("flash.#{self.action_name}", :resource => instance.class.name)
  end
end
