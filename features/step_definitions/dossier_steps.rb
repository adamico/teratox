Then /^I should see dossiers table$/ do |expected_table|
  html_table = table_at("#dossiers").to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '')}}
  expected_table.diff!(html_table)
end

Given /^I should have (\d+) incomplete dossier$/ do |count|
  incompleti = Dossier.incomplets
  incompleti << @dossier
  incompleti.count == count
end

Given /^All dossiers are complete$/ do
  Dossier.incomplets.empty?
end

When /^the search params are not blank$/ do
  params[:search]==ascend_by_date_appel
end
