namespace :db do

  desc "Exporter les poids moyen des enfants des dossiers du groupe solvants"
  task :solvants_birth_weight => :environment do
    require 'csv'

    solvants = Dossier.solvants
    niveaux = Niveau.all.map(&:name)
    niveaux.reject!{|n| n == "NE"}

    CSV.open("avg_bweight.csv", "wb") do |row|
      niveaux.each do |niveau|
        puts "processing niveau: #{niveau}"
        row << [niveau, "#{solvants.with_niveau(niveau).avg_birthweight} (#{solvants.with_niveau(niveau).sd_birthweight}) "]
        puts "done"
      end
    end
    puts "all done"
  end
end
