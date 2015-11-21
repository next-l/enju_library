require 'rails_helper'

RSpec.describe "withdraws/index", type: :view do
  fixtures :all

  before(:each) do
    assign(:withdraws, Kaminari::paginate_array([
      stub_model(Withdraw,
        :item_id => 1,
        :created_at => Time.zone.now
      ),
      stub_model(Withdraw,
        :item_id => 1,
        :created_at => Time.zone.now
      )
    ]).page(1))
    basket = FactoryGirl.create(:basket)
    assign(:basket, basket)
    assign(:withdraw, basket.withdraws.new)
    view.stub(:current_user).and_return(User.friendly.find('enjuadmin'))
  end

  it "renders a list of withdraws" do
    allow(view).to receive(:policy).and_return double(destroy?: true)
    render
    assert_select "tr>td"
  end
end
