require 'rails_helper'

RSpec.describe "withdraws/show", type: :view do
  before(:each) do
    @withdraw = assign(:withdraw, Withdraw.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
