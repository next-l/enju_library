require 'spec_helper'

describe "libraries/new" do
  fixtures :all

  before(:each) do
    assign(:library, stub_model(Library,
      :name => "test"
    ).as_new_record)
    assign(:countries, Country.all)
  end

  it "renders new library form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => libraries_path, :method => "post" do
      assert_select "input#library_name", :name => "library[name]"
    end
  end
end
