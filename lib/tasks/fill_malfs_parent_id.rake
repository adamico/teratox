namespace :db do
  desc "Fill malformation#parent_id with the corrent object id"
  task :fill_malf_parent_id => :environment do

    malfs = Malformation.all
    malfs.each do |m|
      pere = Malformation.find_by_code_terme(m.code_terme_pere)
      unless pere.nil?
        m.parent_id = pere.id
        m.save
      end
    end
  end
end
