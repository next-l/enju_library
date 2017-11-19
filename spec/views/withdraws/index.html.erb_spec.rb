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
    basket = FactoryBot.create(:basket)
    assign(:basket, basket)
    assign(:withdraw, basket.withdraws.new)
  end

  it "renders a list of withdraws" do
    allow(view).to receive(:policy).and_return double(create?: true, update?: true, destroy?: true)
    render
  end
end
