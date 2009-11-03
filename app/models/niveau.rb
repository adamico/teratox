class Niveau < ActiveRecord::Base
  has_many :expositions
  has_many :dossiers
end
