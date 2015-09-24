require 'rails_helper'

RSpec.describe "withdraws/new", type: :view do
  before(:each) do
    assign(:withdraw, Withdraw.new())
  end

  it "renders new withdraw form" do
    render

    assert_select "form[action=?][method=?]", withdraws_path, "post" do
    end
  end
end
