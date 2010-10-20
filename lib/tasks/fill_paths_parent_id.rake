namespace :db do
  desc "Fill pathologie#parent_id with the corrent object id"
  task :fill_paths_parent_id => :environment do

    paths = Pathologie.all
    paths.each do |path|
      pere = Pathologie.find_by_code_terme(path.code_terme_pere)
      unless pere.nil?
        path.parent_id = pere.id
        path.save
      end
    end
  end
end
