# == Schema Information
# Schema version: 20101020132348
#
# Table name: malformations
#
#  id         :integer         not null, primary key
#  libabr     :string(255)
#  level      :integer
#  libelle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#  parent_id  :integer
#

class Malformation < ActiveRecord::Base
  has_ancestry
  has_many :bebes, :through => :malformation_assignments
  has_many :malformation_assignments
end
