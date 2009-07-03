class Search < ActiveRecord::Base
  def dossiers
    @dossiers ||= find_dossiers
  end

  private

  def find_dossiers
    Dossier.all(:order => "date_appel DESC", :conditions => conditions)
  end

  #def produit_conditions
    #["dossiers.produit_ids.first = ?", produit_id] unless produit_id.blank?
  #end

  def n_sicap_conditions
    ["dossiers.n_sicap = ?", n_sicap] unless n_sicap.blank?
  end

  def min_date_conditions
    ["dossiers.date_appel >= ?", min_date] unless min_date.blank?
  end

  def max_date_conditions
    ["dossiers.date_appel <= ?", max_date] unless max_date.blank?
  end

  def acctype_conditions
    ["dossiers.acctype_id = ?", acctype_id] unless acctype_id.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
