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
