namespace :db do
  desc "Creer les CAT préconisées"
  task :populate_cat => :environment do
    phrases = ["Poursuite de l'activité professionnelle sans modification", "Amélioration de l'hygiène de travail", "Suppression de produits et/ou de tâches particulières", "Eviction totale du poste de travail"]

    phrases.each do |p|
      Cat.create(:name => p)
    end
  end
end
