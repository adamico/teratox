namespace :db do
  desc "Import pathologies from a csv"
  task :import_pathologies => :environment do
    require 'csv'
    
    CSV.foreach("pathologies.csv") do |row|
      Pathologie.create(
        :code_terme => row[1],
        :code_terme_pere => row[2],
        :libabr => row[3],
        :level => row[4],
        :libelle => row[5]
      )
    end
  end
end
