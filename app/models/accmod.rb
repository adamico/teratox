class Accmod < ActiveRecord::Base
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: accmods
#
#  id   :integer         not null, primary key
#  abbr :string(255)
#  name :string(255)
#

