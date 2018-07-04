require 'rails_helper'

describe "budget_types/index" do
  before(:each) do
    assign(:budget_types, [
      stub_model(BudgetType,
        name: "public_funds",
        display_name: "Public funds",
        note: "MyText",
        position: 1
      ),
      stub_model(BudgetType,
        name: "donation",
        display_name: "Donation",
        note: "MyText",
        position: 2
      )
    ])
  end

  it "renders a list of budget_types" do
    allow(view).to receive(:policy).and_return double(create?: true, update?: true, destroy?: true)
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: "Public funds".to_s, count: 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
