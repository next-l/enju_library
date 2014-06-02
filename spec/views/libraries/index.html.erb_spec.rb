require 'spec_helper'

describe "libraries/index" do
  fixtures :all

  before(:each) do
    assign(:libraries, Library.page(1))
    assign(:countries, Country.all)
  end

  it "renders a list of libraries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td"
  end
end
