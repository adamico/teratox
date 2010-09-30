require File.dirname(__FILE__) + '/acceptance_helper'

feature "Dossier Form Calc", %q{
  In order to easily obtain grossesse dates and params
  As a db filler
  I want JS to calc for me
} do

  scenario "calc button with ddr pre_filled should calc dg, dap and SA", :js => true do
    visit "/dossiers/new"
    fill_in 'dossier_date_appel', :with => '15/9/2010'
    fill_in 'dossier_ddr', :with => '1/9/2010'
    click_button 'calc'

    page.should have_css("input#dossier_sa", :value => "2")
    page.should have_css("input#dossier_dg", :value => "15/9/2010")
    page.should have_css("input#dossier_dap", :value => "11/6/2011")
  end

  scenario "reset button should erase all fields", :js => true do
    visit "/dossiers/new"
    fill_in 'dossier_date_appel', :with => '15/9/2010'
    fill_in 'dossier_ddr', :with => '1/9/2010'
    click_button 'calc'
    click_button 'reset'

    page.should have_css("input#dossier_ddr", :value => "")
    page.should have_css("input#dossier_sa", :value => "")
    page.should have_css("input#dossier_dg", :value => "")
    page.should have_css("input#dossier_dap", :value => "")
  end

  scenario "calc2 button should calc terme", :js => true do
    visit "/dossiers/new"
    fill_in 'dossier_date_appel', :with => '15/9/2010'
    fill_in 'dossier_ddr', :with => '1/9/2010'
    fill_in 'dossier_dra', :with => '11/6/2011'

    click_button 'calc2'

    page.should have_css("input#dossier_terme", :value => "40")
  end
end
