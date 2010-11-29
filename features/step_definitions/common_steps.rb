Then(/^I should see a "([^\"]*)" flash message for "([^\"]*)"$/) do |key, resource|
   page.should have_content(I18n.t(key, :resource => resource))
end
