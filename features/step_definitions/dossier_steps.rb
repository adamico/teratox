Given /^I have a? dossier? numbered (.+)$/ do |numbers|
  numbers.split(', ').each do |number|
    Factory.create(:dossier, :n_sicap => number)
  end
end

When /^I am listing the dossiers/ do
  visit path_to(dossiers_path)
end
