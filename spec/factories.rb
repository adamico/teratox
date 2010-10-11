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
  f.sequence(:name) {|n| "acctype#{n}"}
end

Factory.define :accmod do |f|
  f.sequence(:name) { |n| "accmod#{n}"}
end

Factory.define :cat do |f|
  f.sequence(:name) { |n| "cat#{n}"}
end

Factory.define :demandeur do |f|
  f.sequence(:name) { |n| "demandeur#{n}"}
end

Factory.define :niveau do |f|
  f.sequence(:name) { |n| "niveau#{n}"}
end

Factory.define :profession do |f|
  f.sequence(:name) { |n| "profession#{n}"}
end

Factory.define :qualite do |f|
  f.sequence(:name) { |n| "qualite#{n}"}
end

Factory.define :specialite do |f|
  f.sequence(:name) { |n| "specialite#{n}"}
end
