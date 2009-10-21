module ControllerHelpers
  def login_as_user
    controller.stub!(:current_user).and_return mock_model(User)
  end
end
