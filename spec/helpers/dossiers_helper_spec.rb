# encoding: utf-8
require 'spec_helper'

describe DossiersHelper do
  describe "#gestite_in_words" do
    let(:dossier) {Factory.build(:dossier)}
    context "when gestite == parite" do
      it "should return 'Gestité : Gn'" do
        dossier.nai = 2
        dossier.save!
        helper.gestite_in_words(dossier).should == "Gestité : G3"
      end
    end
    context "when gestite != parite" do
      it "should return 'Gestité : Gn (dont ATCDn)'" do
        dossier.nai = 1
        dossier.fcs = 2
        dossier.ivg = 1
        dossier.save!
        helper.gestite_in_words(dossier).should == "Gestité : G5 (dont 2 FCS et 1 IVG)"
      end
    end
  end
end
