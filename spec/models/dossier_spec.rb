require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def make_dossier(attributes={})
  @dossier = Dossier.make(attributes)
end

describe Dossier do

  before(:all) do
    Dossier.make(:n_sicap => "LP2", :nom => "Martin")
  end
  after(:all) do
    Dossier.destroy_all
  end
  describe "validates on create" do
    #now all specs will use make_dossier result as subject
    subject { make_dossier(:n_sicap => "LP1", :nom => "Martin") }
    should_validate_presence_of :n_sicap
    should_validate_uniqueness_of :n_sicap
    should_validate_presence_of :nom
    should_validate_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai
    should_validate_numericality_of :sa, :less_than => 40 
  end
end
