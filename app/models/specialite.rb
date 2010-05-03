class Specialite < ActiveRecord::Base
  validates_presence_of :name
  has_many :correspondants
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: specialites
#
#  id   :integer         not null, primary key
#  name :string(255)
#

