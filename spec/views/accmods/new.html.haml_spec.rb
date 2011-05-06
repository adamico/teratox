require 'spec_helper'

describe "accmods/new.html.haml" do
  before(:each) do
    assign(:accmod, stub_model(Accmod).as_new_record)
  end

  it "renders new accmod form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accmods_path, :method => "post" do
    end
  end
end
