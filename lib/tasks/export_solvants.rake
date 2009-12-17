namespace :db do

  desc "Exporter les dossiers du groupe solvants"
  task :export_solvants => :environment do
    require 'fastercsv'

    solvants = Dossier.solvants

    FasterCSV.open("private/solvants.csv", "w") do |row|
      solvants.each do |d|
        row << [d.n_sicap, d.date_appel.year, d.age, d.sa ]
      end
    end
  end
end
