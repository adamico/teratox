require File.dirname(__FILE__) + '/../spec_helper'

describe Correspondant do
  it "should be valid" do
    Correspondant.new.should be_valid
  end
end
