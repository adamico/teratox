require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProduitsController do
  mock_models :produit

  describe :get => :new do
    should_require_login :get, :new

    describe "authenticated user" do
      before(:each) do
        login_as_user
      end
      expects :new, :on => Produit
      should_assign_to :produit
      should_render_template 'new'
    end
  end
end
