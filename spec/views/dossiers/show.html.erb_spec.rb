require 'spec_helper'

describe "dossiers/show.html.erb" do
  it "displays the details of the supplied dossier" do
    profession = Factory(:profession)
    acctype = Factory(:acctype)
    dossier = Factory(:dossier, :n_sicap => "LP1", :nom => "Martin", :acctype => acctype)
    assigns[:dossier] = dossier
    render
    response.should include_text("MARTIN")
  end
end
