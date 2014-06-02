require 'spec_helper'

describe "libraries/show" do
  fixtures :libraries

  before(:each) do
    assign(:library, libraries(:library_00001))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
