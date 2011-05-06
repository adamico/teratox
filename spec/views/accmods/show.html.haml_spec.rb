require 'spec_helper'

describe "accmods/show.html.haml" do
  before(:each) do
    @accmod = assign(:accmod, stub_model(Accmod))
  end

  it "renders attributes in <p>" do
    render
  end
end
