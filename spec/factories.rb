FactoryGirl.define do

  factory :user do
    sequence(:login) { |n| "user#{n}"}
    email { "#{login}@example.com".downcase }
    password 'secret'
    password_confirmation { password }
  end

  factory :admin, :parent => :user do
    admin true
  end

  factory :dossier do
    sequence(:n_sicap) { |n| "LP#{n}" }
    nom 'nom'
    date_appel Time.now.to_date
    acctype
    expo_type 'solvants'
  end

  factory :exposition do
    dossier
    produit
  end

  factory :correspondant do
    name 'Toubib'
  end

  factory :produit do
    name 'tartampionate de sodium'
  end

  factory :acctype do
    sequence(:name) {|n| "acctype#{n}"}
  end

  factory :accmod do
    sequence(:name) { |n| "accmod#{n}"}
  end

  factory :cat do
    sequence(:name) { |n| "cat#{n}"}
  end

  factory :demandeur do
    sequence(:name) { |n| "demandeur#{n}"}
  end

  factory :niveau do
    sequence(:name) { |n| "niveau#{n}"}
  end

  factory :profession do
    sequence(:name) { |n| "profession#{n}"}
  end

  factory :qualite do
    sequence(:name) { |n| "qualite#{n}"}
  end

  factory :specialite do
    sequence(:name) { |n| "specialite#{n}"}
  end
end
