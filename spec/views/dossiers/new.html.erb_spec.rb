require 'spec_helper'

describe "dossiers/new.html.erb" do
  it "renders a form to create a message" do
    dossier = Factory.stub(:dossier)
    assigns[:dossier] = dossier
  end
end
