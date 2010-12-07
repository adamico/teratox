class Profession < ActiveRecord::Base
  validates_presence_of :name

  has_many :dossiers
end




# == Schema Information
# Schema version: 20101207134125
#
# Table name: professions
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  dossiers_count :integer
#

