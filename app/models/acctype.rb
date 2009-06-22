class Acctype < ActiveRecord::Base
  has_many :dossiers

  def abbrev
    case id
    when 1..5
      "#{abbr}*"
    else
     abbr
    end
  end
end
