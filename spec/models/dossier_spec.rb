require 'spec_helper'

describe Dossier do
  it "should not be valid" do
    Dossier.new.should_not be_valid
  end

  let(:dossier) { Factory(:dossier)}

  describe "#grsant" do
    it "should be equal to previous pregnancies + 1" do
      dossier.miu = 1
      dossier.nai = 1
      dossier.geu = 1
      dossier.fcs = 1
      dossier.ivg = 1
      dossier.img = 1
      dossier.grsant.should == 6
    end
  end

  describe "#patient_age" do
    it "should return age in years" do
      dossier.date_naissance = 10.years.ago.to_date
      dossier.patient_age.should == 10
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

