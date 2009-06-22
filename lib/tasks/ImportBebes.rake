
namespace :db do

  desc "Importer les données des bebes d'un fichier csv"
  task :load_csv_data => :environment do
    require 'fastercsv'

    FasterCSV.foreach("lib/tasks/bebe.csv") do |row|
      Bebe.create(:id => row[0], :dossier_id => row[1], 
                  :malformation => row[2], :pathologie => row[3],
                  :pathologie => row[4], :sexe => row[5], :poids => row[6],
                  :apgar1 => row[7], :apgar5 => row[8], :pc => row[9],
                  :taille => row[10])
    end
  end

end
