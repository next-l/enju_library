require 'rails_helper'

RSpec.describe "withdraws/new", type: :view do
  fixtures :all

  before(:each) do
    assign(:withdraw, stub_model(Withdraw,
                                 item_id: FactoryBot.create(:item).id
    ).as_new_record)
    assign(:basket, baskets(:basket_00001))
    assign(:withdraws, Withdraw.page(1))
    view.stub(:current_user).and_return(User.friendly.find('enjuadmin'))
  end

  it "renders new withdraw form" do
    render

    assert_select "form", action: withdraws_path, method: "post" do
      assert_select "input#withdraw_item_identifier", name: "withdraw[item_identifier]"
    end
  end
end
