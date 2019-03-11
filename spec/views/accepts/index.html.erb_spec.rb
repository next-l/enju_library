require 'rails_helper'

describe "accepts/index" do
  fixtures :all

  before(:each) do
    assign(:accepts, Kaminari::paginate_array([
      stub_model(Accept,
        id: 'ad9f71dc-2696-4ffb-b517-2ab824bcd4df',
        item_id: 1,
        created_at: Time.zone.now
      ),
      stub_model(Accept,
        id: '5903b664-4c61-49e2-8d1a-6d2bfc218e23',
        item_id: 2,
        created_at: Time.zone.now
      )
    ]).page(1))
    basket = FactoryBot.create(:basket)
    assign(:basket, basket)
    assign(:accept, basket.accepts.new)
  end

  it "renders a list of accepts" do
    allow(view).to receive(:policy).and_return double(create?: true, destroy?: true)
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td"
  end
end
