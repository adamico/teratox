# == Schema Information
# Schema version: 20101020132348
#
# Table name: pathologies
#
#  id              :integer         not null, primary key
#  code_terme      :integer
#  code_terme_pere :integer
#  libabr          :string(255)
#  level           :integer
#  libelle         :string(255)
#  parent_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  ancestry        :string(255)
#

class Pathologie < ActiveRecord::Base
  has_ancestry
end
