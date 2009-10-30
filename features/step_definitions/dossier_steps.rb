Given /^the following (.+) records?$/ do |factory, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /^I should have (\d+) incomplete dossier$/ do |count|
  incompleti = Dossier.incomplets
  incompleti << @dossier
  incompleti.count == count
end

Given /^All dossiers are complete$/ do
  Dossier.incomplets.empty?
end
