require 'spec_helper'

describe "accmods/edit.html.haml" do
  before(:each) do
    @accmod = assign(:accmod, stub_model(Accmod))
  end

  it "renders the edit accmod form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accmods_path(@accmod), :method => "post" do
    end
  end
end
