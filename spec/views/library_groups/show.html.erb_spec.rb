require 'rails_helper'

describe "library_groups/show" do
  before(:each) do
    @library_group = LibraryGroup.site_config
    allow(view).to receive(:policy).and_return double(create?: true, update?: true, destroy?: true)
  end

  it "renders attributes in <p>" do
    render
  end
end
