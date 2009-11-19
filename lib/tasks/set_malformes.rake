namespace :db do
  desc "Sets Bebe#malforme to 1 if malformation = true"
  task :set_malformes => :environment do

    @count = 0
    Bebe.all.each do |b|
      if b.malformation?
        puts "Bebe number #{b.id} has malformation = true"
        b.malforme = 1
        b.save
        @count += 1
      end
    end
    puts "\nAll done, found #{@count} bebes malformes"
  end
end
