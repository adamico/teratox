require 'test_helper'

class DossiersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dossiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dossier" do
    assert_difference('Dossier.count') do
      post :create, :dossier => { }
    end

    assert_redirected_to dossier_path(assigns(:dossier))
  end

  test "should show dossier" do
    get :show, :id => dossiers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dossiers(:one).to_param
    assert_response :success
  end

  test "should update dossier" do
    put :update, :id => dossiers(:one).to_param, :dossier => { }
    assert_redirected_to dossier_path(assigns(:dossier))
  end

  test "should destroy dossier" do
    assert_difference('Dossier.count', -1) do
      delete :destroy, :id => dossiers(:one).to_param
    end

    assert_redirected_to dossiers_path
  end
end
