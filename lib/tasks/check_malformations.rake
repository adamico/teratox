namespace :db do
  desc "Prints out ids of bebes with malformation = true"
  task :check_malformations => :environment do

    @count = 0
    Bebe.all.each do |b|
      if b.malformation?
        puts "Bebe number #{b.id} has malformation = true"
        @count += 1
      end
    end
    puts "\nAll done, found #{@count} bebes malformes"
  end
end
