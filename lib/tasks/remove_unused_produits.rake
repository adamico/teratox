namespace :db do
  desc "Remove unused produits from the produits table"
  task :remove_unused_produits => :environment do
    Produit.all.each do |p|
      if Dossier.expositions_produit_name_like(p.name).empty?
        p.destroy
        puts "Successfully removed Produit : #{p.name}"
      else
        puts "Nothing done... I found #{Dossier.expositions_produit_name_like(p.name).count} dossier(s) with Produit : #{p.name}"
      end
    end
  end
end
