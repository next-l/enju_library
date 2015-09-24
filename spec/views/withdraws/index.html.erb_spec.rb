require 'rails_helper'

RSpec.describe "withdraws/index", type: :view do
  before(:each) do
    assign(:withdraws, [
      Withdraw.create!(),
      Withdraw.create!()
    ])
  end

  it "renders a list of withdraws" do
    allow(view).to receive(:policy).and_return double(create?: true, update?: true, destroy?: true)
    render
  end
end
