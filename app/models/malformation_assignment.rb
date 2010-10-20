# == Schema Information
# Schema version: 20101020132348
#
# Table name: malformation_assignments
#
#  id              :integer         not null, primary key
#  bebe_id         :integer
#  malformation_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class MalformationAssignment < ActiveRecord::Base
  belongs_to :bebe
  belongs_to :malformation

  def malformation_name
    malformation.libelle if malformation
  end
  def malformation_name=(name)
    self.malformation = Malformation.find_by_libelle(name) unless name.blank?
  end
end
