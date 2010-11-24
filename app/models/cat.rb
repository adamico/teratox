class Cat < ActiveRecord::Base
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
end




# == Schema Information
# Schema version: 20101124150327
#
# Table name: cats
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  dossiers_count :integer
#

