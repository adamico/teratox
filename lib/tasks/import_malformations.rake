namespace :db do
  desc "Import malformations from a csv"
  task :import_malformations => :environment do
    require 'csv'
    
    CSV.foreach("malformations.csv") do |row|
      Malformation.create(
        :code_terme => row[1],
        :code_terme_pere => row[2],
        :libabr => row[3],
        :level => row[4],
        :libelle => row[5]
      )
    end
  end
end
