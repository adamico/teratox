module ControllerMacros

  def should_require_login(request_method, action)
    describe "anonymous user" do
      it "should redirect to the login page" do
        send request_method, action
        response.should redirect_to(login_path)
      end
      it "should not call the #{action} action" do
        controller.should_not_receive(action)
        send request_method, action
      end
    end
  end
end
