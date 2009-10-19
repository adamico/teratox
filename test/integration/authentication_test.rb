require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest
  test "logging in with valid username and password" do
    User.create!(:username => "ada", :password => "secret")
    visit login_url
    fill_in "Utilisateur", :with => "ada"
    fill_in "Mot de passe", :with => "secret"
    click_button "Se connecter"
    assert_contain "Utilisateur connecté avec succès."
  end

end
