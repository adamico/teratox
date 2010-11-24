class Niveau < ActiveRecord::Base
  has_many :expositions
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
end




# == Schema Information
# Schema version: 20101124133728
#
# Table name: niveaux
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  dossiers_count :integer
#

