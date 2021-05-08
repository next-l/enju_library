require 'rails_helper'

describe "accepts/show" do
  before(:each) do
    assign(:accept, FactoryBot.create(:accept))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
