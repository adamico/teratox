# encoding: utf-8
require 'spec_helper'

describe DossiersHelper do
  let(:dossier) {Factory.build(:dossier)}

  describe "#gestite_in_words" do
    subject {helper.gestite_in_words(dossier)}
    context "when gestite == parite" do
      before do
        dossier.nai = 2
        dossier.save!
      end
      it {should == "Gestité : G3"}
    end
    context "when gestite != parite" do
      before do
        dossier.nai = 1
        dossier.fcs = 2
        dossier.ivg = 1
        dossier.save!
      end
      it {should == "Gestité : G5 (dont 2 FCS et 1 IVG)"}
    end
  end

  describe "#evolution" do
    subject {helper.evolution(dossier)}
    let(:naissance) {Factory(:acctype, :name => "naissance", :abbr => "NAI")}
    let(:vbs) {Factory(:accmod, :name => "voie basse spontanée")}
    context "when acctype is 'naissance'" do
      before do
        dossier.acctype = naissance
        dossier.terme = 40
        dossier.accmod = vbs
      end
      it {should == "Naissance à 40 SA par voie basse spontanée"}
    end
  end

  describe "#atcds" do
    subject {helper.atcds(dossier, field)}
    let(:field) {"ap"}
    let(:comm) {"commentaire for #{field}"}
    context "when 0" do
      before do 
        dossier.send("#{field}=", 0)
        dossier.send("comm_#{field}=", comm)
      end
      it {should == comm}
    end
    context "when 1" do
      before do 
        dossier.send("#{field}=", 1)
      end
      it {should == "aucun"}
    end
    context "when everything else" do
      before do
        dossier.send("#{field}=", 2)
      end
      it {should == "non précisé"}
    end
  end

  describe "#cigarettes" do
    subject {helper.cigarettes(dossier)}
    context "when 0" do
      before do
        dossier.tabac = 0
      end
      it {should == "ne fume pas"}
    end
    context "when 1-3" do
      before do
        dossier.tabac = 1
      end
      it {should == "fume jusqu'à 5 cigarettes par jour"}
    end
    context "when 4" do
      before do
        dossier.tabac = 4
      end
      it {should == "consommation inconnue"}
    end
  end

  describe "#boisson" do
    subject {helper.boisson(dossier)}
    context "when 0" do
      before do
        dossier.alcool = 0
      end
      it {should == "ne boit pas"}
    end
    context "when 1-2" do
      before do
        dossier.alcool = 1
      end
      it {should == "consommation occasionnelle (moins de 2 verres par jour)"}
    end
    context "when 3" do
      before do
        dossier.alcool = 3
      end
      it {should == "consommation inconnue"}
    end
  end
end
