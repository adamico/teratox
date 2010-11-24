require 'spec_helper'

describe BilanController do

  describe "GET 'donnees_generales'" do
    it "should be successful" do
      get 'donnees_generales'
      response.should be_success
    end
  end

  describe "GET 'niveaux'" do
    it "should be successful" do
      get 'niveaux'
      response.should be_success
    end
  end

  describe "GET 'issues'" do
    it "should be successful" do
      get 'issues'
      response.should be_success
    end
  end

  describe "GET 'stratification'" do
    it "should be successful" do
      get 'stratification'
      response.should be_success
    end
  end

end
