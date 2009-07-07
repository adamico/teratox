class Search < ActiveRecord::Base
  def dossiers
    @dossiers ||= find_dossiers
  end

  private

  def find_dossiers
    cons = {
      :min_date => ["dossiers.date_appel >= ?", min_date],
      :max_date => ["dossiers.date_appel <= ?", max_date],
      :acctype_id => ["dossiers.acctype_id = ?", acctype_id]
    }
    scope = Dossier.scoped({})
    cons.each { |attribute, carray| scope = scope.conditions carray[0], carray[1] unless send(attribute).blank?}
    scope = scope.scoped :include => :produits, :conditions => ['produits.id = ?', produit_id ]
    scope
  end
end
