require 'rails_helper'

describe "accepts/new" do
  fixtures :all

  before(:each) do
    assign(:accept, stub_model(Accept,
      item_id: Item.first
    ).as_new_record)
    assign(:basket, baskets(:basket_00001))
    assign(:accepts, Accept.page(1))
    view.stub(:current_user).and_return(User.where(username: 'enjuadmin').first)
  end

  it "renders new accept form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", action: accepts_path, method: "post" do
      assert_select "input#accept_item_identifier", name: "accept[item_identifier]"
    end
  end
end
