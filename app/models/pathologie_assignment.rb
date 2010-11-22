class PathologieAssignment < ActiveRecord::Base
  belongs_to :bebe
  belongs_to :pathologie

  def pathologie_name
    pathologie.libelle if pathologie
  end
  def pathologie_name=(name)
    self.pathologie = Pathologie.find_by_libelle(name) unless name.blank?
  end
end

# == Schema Information
# Schema version: 20101020134225
#
# Table name: pathologie_assignments
#
#  id            :integer         not null, primary key
#  bebe_id       :integer
#  pathologie_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

