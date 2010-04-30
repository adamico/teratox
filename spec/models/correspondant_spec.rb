require File.dirname(__FILE__) + '/../spec_helper'

describe Correspondant do
  it "should be valid"
end

# == Schema Information
#
# Table name: correspondants
#
#  id            :integer         not null, primary key
#  specialite_id :integer
#  qualite_id    :integer
#  formule_id    :integer
#  name          :string(255)
#  adresse       :text
#  cp            :integer
#  ville         :string(255)
#  tel           :integer
#  fax           :integer
#  poste         :integer
#  email         :string(255)
#

