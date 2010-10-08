class Acctype < ActiveRecord::Base
  has_many :dossiers
  validates :name,
    :presence => true,
    :uniqueness => { :case_sensitive => false }

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
# Schema version: 20100105082615
#
# Table name: acctypes
#
#  id   :integer         not null, primary key
#  abbr :string(255)
#  name :string(255)
#

