require 'spec_helper'

describe Dossier do
  subject {Factory.build(:dossier)}

  it "should require a #n_sicap" do
    subject.n_sicap = nil
    subject.should_not be_valid
  end

  describe "#grsant" do
    it "should be equal to previous pregnancies + 1" do
      %w[miu nai geu fcs ivg img].each do |item|
        subject.send("#{item}=", 1)
      end
      subject.grsant.should == 6
    end
  end

  describe "#patient_age" do
    it "should return age in years" do
      subject.date_naissance = 10.years.ago.to_date
      subject.patient_age.should == 10
    end
  end

end

# == Schema Information
#
# Table name: dossiers
#
#  id               :integer         not null, primary key
#  n_sicap          :string(255)
#  acctype_id       :integer
#  correspondant_id :integer
#  profession_id    :integer
#  ncode            :integer
#  date_appel       :date
#  ddr              :date
#  dra              :date
#  dap              :date
#  dg               :date
#  nom              :string(30)
#  prenom           :string(30)
#  age              :integer
#  ap               :integer
#  af               :integer
#  assmedproc       :integer
#  fcs              :integer         default(0)
#  geu              :integer         default(0)
#  miu              :integer         default(0)
#  ivg              :integer         default(0)
#  img              :integer         default(0)
#  nai              :integer         default(0)
#  terme            :integer
#  accmod_id        :integer
#  path_mat         :integer
#  tabac            :integer
#  alcool           :integer
#  sa               :integer
#  comm_ap          :text
#  comm_af          :text
#  comm_expo        :text
#  comm_evol        :text
#  comm_bebe        :text
#  commentaire      :text
#  created_at       :datetime
#  updated_at       :datetime
#  niveau_id        :integer
#  cat_id           :integer
#  demandeur_id     :integer
#  bebes_count      :integer         default(0)
#  expo_type        :string(255)
#  gestite          :integer
#  terato           :boolean         default(FALSE)
#  date_naissance   :date
#  anomalie_echo    :boolean
#  rciu             :boolean
#

