class Qualite < ActiveRecord::Base
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false}
  has_many :correspondants
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: qualites
#
#  id   :integer         not null, primary key
#  name :string(255)
#

