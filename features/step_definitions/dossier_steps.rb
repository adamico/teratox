Given /^I have a? dossier? numbered (.+)$/ do |numbers|
  numbers.split(', ').each do |number|
   @dossier = Factory.create(:dossier, :n_sicap => number)
  end
end
