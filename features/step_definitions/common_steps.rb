Then(/^I should see a "([^\"]*)" flash message for "([^\"]*)"$/) do |action, resource|
   page.should have_content(I18n.t("flash.#{action}", :resource => resource))
end

When(/^I press the "([^"]*)" button$/) do |action|
  string = action.downcase.split(" ").reverse.join(".")
  translated_string = I18n.t("helpers.submit.#{string}")
  When %{I press "#{translated_string}"}
end
