require 'rails_helper'

describe "accepts/edit" do
  before(:each) do
    @accept = assign(:accept, stub_model(Accept,
      id: 'ad9f71dc-2696-4ffb-b517-2ab824bcd4df',
      item_id: 1
    ))
  end

  it "renders the edit accept form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", action: accepts_path(@accept), method: "post" do
      assert_select "input#accept_item_id", name: "accept[item_id]"
    end
  end
end
