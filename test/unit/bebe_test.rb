require 'test_helper'

class BebeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: bebes
#
#  id           :integer         not null, primary key
#  dossier_id   :integer
#  malformation :boolean
#  pathologie   :boolean
#  sexe         :integer
#  poids        :string(255)
#  apgar1       :string(255)
#  apgar5       :string(255)
#  pc           :string(255)
#  taille       :string(255)
#  malforme     :integer         default(0)
#

