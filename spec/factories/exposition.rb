Factory.define :exposition do |e|
  e.produit {|p| p.association(:produit)}
  e.niveau {|n| n.association(:niveau)}
end
