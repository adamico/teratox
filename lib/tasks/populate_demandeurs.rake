namespace :db do
  desc "Creer les demandeurs"
  task :populate_demandeurs => :environment do
    demandeurs = ["patiente", "médecin généraliste", "médecin du travail", "gynécologue"]

    demandeurs.each do |p|
      Demandeur.create(:name => p)
    end
  end
end
