require 'rails_helper'

RSpec.describe "withdraws/new", type: :view do
  fixtures :all

  before(:each) do
    assign(:withdraw, stub_model(Withdraw,
      :item_id => Shelf.first
    ).as_new_record)
    assign(:basket, baskets(:basket_00001))
    assign(:withdraws, Withdraw.page(1))
    view.stub(:current_user).and_return(User.find_by(username: 'enjuadmin'))
    allow(view).to receive(:policy).and_return double(create?: true, update?: true, destroy?: true)
  end

  it "renders new withdraw form" do
    render

    assert_select "form", :action => withdraws_path, :method => "post" do
      assert_select "input#withdraw_item_identifier", :name => "withdraw[item_identifier]"
    end
  end
end
