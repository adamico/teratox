# == Schema Information
# Schema version: 20101012185727
#
# Table name: malformations
#
#  id              :integer         not null, primary key
#  code_terme      :integer
#  code_terme_pere :integer
#  libabr          :string(255)
#  level           :integer
#  libelle         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  ancestry        :string(255)
#  parent_id       :integer
#

class Malformation < ActiveRecord::Base
  has_ancestry
  has_and_belongs_to_many :bebes
end
