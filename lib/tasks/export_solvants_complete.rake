#encoding=utf-8
namespace :db do

  desc "Exporter toutes les données les dossiers du groupe solvants"
  task :export_solvants_complete => :environment do
    require 'csv'

    solvants = Dossier.solvants

    CSV.open("private/solvants_complete.csv", "wb") do |row|
      solvants.each do |d|
        row << [d.n_sicap, d.date_appel.year, d.age, d.sa, d.gestite, d.fcs, d.geu, d.miu, d.ivg, d.nai, d.tabac, d.alcool, d.acctype.abbr]
      end
    end
  end
end
