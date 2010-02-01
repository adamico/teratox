#encoding=utf-8
namespace :db do

  desc "Exporter les dossiers du groupe solvants technicienne de labo"
  task :export_solvants_tl => :environment do
    require 'csv'

    cas = Dossier.solvants.profession_id_is(14)

    CSV.open("private/solvants_tl.csv", "wb") do |row|
      cas.each do |d|
        row << [d.n_sicap, d.date_appel.year, d.age, d.sa, d.gestite, d.fcs, d.geu, d.miu, d.ivg, d.nai, d.acctype.abbr, d.niveau.name, d.terato]
      end
    end
  end
end
