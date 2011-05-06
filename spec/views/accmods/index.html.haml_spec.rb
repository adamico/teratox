require 'spec_helper'

describe "accmods/index.html.haml" do
  before(:each) do
    assign(:accmods, [
      stub_model(Accmod),
      stub_model(Accmod)
    ])
  end

  it "renders a list of accmods" do
    render
  end
end
