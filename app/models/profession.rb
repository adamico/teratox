class Profession < ActiveRecord::Base
  has_many :dossiers
end
