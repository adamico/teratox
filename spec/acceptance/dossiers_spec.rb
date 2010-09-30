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
  
  scenario "dossier form calculations", :js => true do
    visit "/dossiers/new"
    fill_in 'dossier_date_appel', :with => '15/9/2010'
    fill_in 'dossier_ddr', :with => '1/9/2010'
    click_button 'calc'

    page.should have_css("input#dossier_sa", :value => "2")
  end
end
