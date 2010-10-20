namespace :db do

  desc "Exporter les dossiers du groupe solvants technicienne de labo"
  task :export_solvants_tl => :environment do
    require 'fastercsv'

    cas = Dossier.solvants.profession_id_is(14)

    FasterCSV.open("private/solvants_tl.csv", "wb") do |row|
      cas.each do |d|
        row << [d.n_sicap, d.acctype.abbr, d.niveau.name, d.terme, d.bebes.map(&:poids).join(', ')]
      end
    end
  end
end
