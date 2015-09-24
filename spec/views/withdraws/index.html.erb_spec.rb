require 'rails_helper'

RSpec.describe "withdraws/index", type: :view do
  before(:each) do
    assign(:withdraws, [
      Withdraw.create!(),
      Withdraw.create!()
    ])
  end

  it "renders a list of withdraws" do
    render
  end
end
