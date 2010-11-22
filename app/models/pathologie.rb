class Pathologie < ActiveRecord::Base
  has_ancestry
end

# == Schema Information
# Schema version: 20101020134225
#
# Table name: pathologies
#
#  id         :integer         not null, primary key
#  libabr     :string(255)
#  level      :integer
#  libelle    :string(255)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#

