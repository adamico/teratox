Factory.define(:correspondant) do |c|
  c.nom 'Toubib'
  c.adresse '99, Rue des Foldingues'
  c.ville 'Paranoia'
  c.cp '99999'
  c.qualite {|q| q.association(:qualite)}
  c.specialite {|s| s.association(:specialite)}
end
