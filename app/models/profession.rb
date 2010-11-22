class Profession < ActiveRecord::Base
  validates_presence_of :name

  has_many :dossiers
end



# == Schema Information
# Schema version: 20101020134225
#
# Table name: professions
#
#  id   :integer         not null, primary key
#  name :string(255)
#

