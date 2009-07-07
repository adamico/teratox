class Search < ActiveRecord::Base
  def dossiers
    @dossiers ||= find_dossiers
  end

  private

  def find_dossiers
    scope = Dossier.scoped({})
    scope = scope.conditions "dossiers.date_appel >= ?", min_date unless min_date.blank?
    scope = scope.conditions "dossiers.date_appel <= ?", max_date unless max_date.blank?
    scope = scope.conditions "dossiers.acctype_id = ?", acctype_id unless acctype_id.blank?
    scope
  end
end
