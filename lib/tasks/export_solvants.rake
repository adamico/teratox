namespace :db do

  desc "Exporter les dossiers du groupe solvants"
  task :export_solvants => :environment do
    require 'csv'

    solvants = Dossier.solvants
    solvants.reject!{|n| n == "NE"}

    CSV.open("private/solvants.csv", "wb") do |row|
      solvants.each do |d|
        row << [d.n_sicap, d.date_appel.year, d.age, d.sa ] 
      end
    end
  end
end
