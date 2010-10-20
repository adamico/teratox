namespace :db do
  desc "Set zero fields for grs atcds when null"
  task :set_zero_fields => :environment do

    Dossier.all.each do |d|
      d.fcs = 0 if d.fcs.nil?
      d.geu = 0 if d.geu.nil?
      d.miu = 0 if d.miu.nil?
      d.ivg = 0 if d.ivg.nil?
      d.img = 0 if d.img.nil?
      d.nai = 0 if d.nai.nil?
      d.save
    end
  end
end
