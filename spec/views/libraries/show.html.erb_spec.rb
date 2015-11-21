require 'spec_helper'

describe "libraries/show" do
  fixtures :all
  before(:each) do
    @events = Kaminari::paginate_array([]).page(1)
    assign(:library, FactoryGirl.create(:library, :street => "\tStreet 1-2"))
  end

  it "renders a library detail" do
    allow(view).to receive(:policy).and_return double(create?: true, update?: true)
    render
    expect(rendered).to include "library"
  end
end
