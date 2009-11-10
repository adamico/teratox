class Correspondant < ActiveRecord::Base
  has_many :dossiers
  belongs_to :specialite
  belongs_to :qualite
end
