#encoding=utf-8
namespace :db do

  desc "Exporter les dossiers du groupe solvants <= 20 SA"
  task :export_solvants_20sa => :environment do
    require 'csv'

    cas = Dossier.solvants.sa_lt(21)

    CSV.open("private/solvants_20SA.csv", "wb") do |row|
      cas.each do |d|
        row << [d.n_sicap, d.date_appel.year, d.age, d.sa, d.gestite, d.fcs, d.geu, d.miu, d.ivg, d.nai, d.tabac, d.alcool, d.acctype.abbr, d.niveau.name, d.terato]
      end
    end
  end
end
