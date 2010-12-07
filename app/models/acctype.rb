class Acctype < ActiveRecord::Base
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }

  #TODO: move this to a helper or delete
  def abbrev
    case id
    when 1..5
      "#{abbr}*"
    else
     abbr
    end
  end
end




# == Schema Information
# Schema version: 20101124133728
#
# Table name: acctypes
#
#  id             :integer         not null, primary key
#  abbr           :string(255)
#  name           :string(255)
#  dossiers_count :integer
#

