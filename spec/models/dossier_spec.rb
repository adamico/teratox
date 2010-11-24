require 'spec_helper'

describe Dossier do
  subject {Factory.build(:dossier)}

  it "should require a #n_sicap" do
    subject.n_sicap = nil
    subject.should_not be_valid
  end

  describe "when saved" do
    it "should calculate and assign gestite" do
      %w[miu nai geu fcs ivg img].each do |item|
        subject.send("#{item}=", 1)
      end
      subject.save!
      subject.gestite.should == 7
    end
  end

  describe "#patient_age" do
    it "should return age in years" do
      subject.date_naissance = 10.years.ago.to_date
      subject.patient_age.should == 10
    end
  end

  describe "statistical methods" do
    before do
      %w(13 23 12 44 55).each do |n|
        Factory(:dossier, :nai => n.to_i)
      end
    end
    describe ".mean(column)" do
      it "should return mean for column" do
        Dossier.mean(:nai).should == 29.4
      end
    end

    describe ".std_deviation(column)" do
      it "should return standard deviation for column"  do
        Dossier.std_deviation(:nai).round(5).should == 19.24318
      end
    end

    describe ".mean_and_sd(column)" do
      it "should return mean and sd for column" do
        Dossier.mean_and_sd(:nai, round=2).should == "29.4 (19.24)"
      end
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

