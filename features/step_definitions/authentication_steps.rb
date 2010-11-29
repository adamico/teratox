Given(/^I am not authenticated$/) do
  visit destroy_user_session_path
end

Given(/^I am a new authenticated user$/) do
  login = 'user'
  password = 'secretpass'

  Given %{a user exists with login: "#{login}", password: "#{password}"}
  When %{I go to the login page}
  And %{I fill in "user_login" with "#{login}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end
