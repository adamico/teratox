require File.dirname(__FILE__) + '/acceptance_helper'

feature "Dossiers", %q{
  In order to have a great database of chems teratogen exposures
  As a filler of the db
  I want to create and manage dossiers
} do

  scenario "dossiers#index with no search params should render recent dossiers" do
    11.times do |n|
      Factory(:dossier, :n_sicap => "LP#{n}")
    end
    visit dossier_index
    10.times do |n|
      page.should have_content("LP#{n+1}")
    end
    page.should_not have_content('LP11')
    Dossier.recent.all.count.should == 10
  end

  scenario "dossiers#index with search params present should render search result" do
    2.times do |n|
      Factory(:dossier, :n_sicap => "LP#{n}", :nom => "nom#{n}")
    end
    visit dossier_index
    fill_in "search_nom_contains", :with => "nom"
    click_button "Rechercher"

    page.should have_content("LP0")
    page.should have_content("LP1")
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

    click_button "Create Dossier"

    Dossier.count.should == 1
  end
end
