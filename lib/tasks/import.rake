namespace :db do

  desc "Puts default professions in the database"
  task :import_professions => :environment do

    Profession.create :nom => "Laborantine"
    Profession.create :nom => "Ouvriere"
    Profession.create :nom => "Pressing"
    Profession.create :nom => "Employée"

  end
end
