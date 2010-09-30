Factory.define :dossier do |d|
  d.sequence(:n_sicap) { |n| "LP#{n}" }
  d.nom 'Martin'
  d.date_appel '20/6/2010'.to_date
  d.association :acctype
end

Factory.define(:correspondant) do |c|
  c.name 'Toubib'
end

Factory.define :produit do |p|
  p.name 'tartampionate de sodium'
end

Factory.define :acctype do |f|
  f.name "acctype"
end

