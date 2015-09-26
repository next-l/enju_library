require 'rails_helper'

RSpec.describe "withdraws/show", type: :view do
  before(:each) do
    @withdraw = assign(:withdraw, FactoryGirl.create(:withdraw))
  end

  it "renders attributes in <p>" do
    render
  end
end
