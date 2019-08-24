require 'rails_helper'

describe "library_groups/edit" do
  before(:each) do
    @library_group = LibraryGroup.site_config
    @available_languages = Language.where(iso_639_1: I18n.available_locales.map{|l| l.to_s})
    @countries = Country.all
  end

  it "renders color forms." do
    render
    expect(rendered).to have_css "input#library_group_colors_attributes_0_code"
    expect(rendered).not_to have_css "input#library_group_colors_attributes_0__destroy", visible: false
    expect(rendered).not_to have_xpath '//a[@data-association="color" and @class="add_fields"]'
  end
end
