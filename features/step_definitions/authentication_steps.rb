Given(/^I am not authenticated$/) do
  When %{I go to the logout page}
end

Given(/^I am a new authenticated (\w+)$/) do |user|
  login = 'user'
  password = 'secretpass'

  Given %{a #{user} exists with login: "#{login}", password: "#{password}"}
  When %{I go to the login page}
  And %{I fill in "user_login" with "#{login}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

When(/^I logout$/) do
  Given %{I am not authenticated}
end
