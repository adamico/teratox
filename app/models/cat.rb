class Cat < ActiveRecord::Base
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
end



# == Schema Information
# Schema version: 20101020134225
#
# Table name: cats
#
#  id   :integer         not null, primary key
#  name :string(255)
#

