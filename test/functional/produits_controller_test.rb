require 'test_helper'

class ProduitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produit" do
    assert_difference('Produit.count') do
      post :create, :produit => { }
    end

    assert_redirected_to produit_path(assigns(:produit))
  end

  test "should show produit" do
    get :show, :id => produits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => produits(:one).to_param
    assert_response :success
  end

  test "should update produit" do
    put :update, :id => produits(:one).to_param, :produit => { }
    assert_redirected_to produit_path(assigns(:produit))
  end

  test "should destroy produit" do
    assert_difference('Produit.count', -1) do
      delete :destroy, :id => produits(:one).to_param
    end

    assert_redirected_to produits_path
  end
end
