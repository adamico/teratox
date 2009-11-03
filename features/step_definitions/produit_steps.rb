Given /^I have a? produits? named (.+)$/ do |names|
  names.split(', ').each do |name|
    Factory.create(:produit, :name => name)
  end
end
