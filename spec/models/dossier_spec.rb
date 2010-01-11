require File.dirname(__FILE__) + '/../spec_helper'

describe Dossier do
  
  before(:each) do
    @dossier = Factory.create(:dossier,
                       :fcs => 1,
                       :geu => 1,
                       :miu => 1,
                       :ivg => 1,
                       :img => 1,
                       :nai => 1)
  end

  describe "#gestite" do
    it "should be equal to previous pregnancies + 1" do
      @dossier.gestite.should == 7
    end
  end

end
