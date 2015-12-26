require 'spec_helper'

describe "library_groups/edit" do
  before(:each) do
    @library_group = LibraryGroup.site_config
    @available_languages = Language.where(iso_639_1: I18n.available_locales.map{|l| l.to_s})
    @countries = Country.all
  end

  it "renders attributes in <p>" do
    render
  end
end
