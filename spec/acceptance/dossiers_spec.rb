require File.dirname(__FILE__) + '/acceptance_helper'

feature "Dossiers", %q{
  In order to have a great database of chems teratogen exposures
  As a filler of the db
  I want to create and manage dossiers
} do

  scenario "Dossier index" do
    Factory(:dossier, :n_sicap => "LP1")
    Factory(:dossier, :n_sicap => "LP2")
    visit dossier_index
    page.should have_content('LP1')
    page.should have_content('LP2')
  end

  scenario "creating a dossier" do
    5.times do
      Factory(:acctype)
    end

    visit "/dossiers/new"

    fill_in "dossier_n_sicap", :with => "LP1"
    fill_in "dossier_nom", :with => "value for dossier#nom"
    fill_in "dossier_date_appel", :with => Time.now.to_date
    choose "dossier_acctype_id_4"

    click_button "Enregistrer"

    Dossier.count.should == 1
  end
end
