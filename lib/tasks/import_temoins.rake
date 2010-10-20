namespace :db do
  desc "Import temoins from a csv"
  task :import_temoins => :environment do
    require 'fastercsv'

    FasterCSV.foreach("private/temoins.csv") do |row|
      Dossier.create(
        :n_sicap => row[0],
        :date_appel => Date.new(row[1],1,1).to_datetime,
        :age => row[2],
        :sa => row[3]
      )
    end
  end
end
