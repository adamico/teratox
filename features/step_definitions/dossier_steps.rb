Given /^I have a? dossier? numbered (.+)$/ do |numbers|
  numbers.split(', ').each do |number|
   @dossier = Factory.create(:dossier, :n_sicap => number)
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
