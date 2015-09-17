require 'spec_helper'

describe "libraries/show" do
  fixtures :all
  before(:each) do
    @events = Kaminari::paginate_array([]).page(1)
  end

  it "renders a library detail" do
    assign(:library, FactoryGirl.create(:library, :street => "\tStreet 1-2"))
    render
    expect(rendered).to include "library"
  end
end
