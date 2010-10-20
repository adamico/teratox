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
