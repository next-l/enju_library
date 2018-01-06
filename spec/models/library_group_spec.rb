# -*- encoding: utf-8 -*-
require 'rails_helper'

describe LibraryGroup do
  fixtures :library_groups

  it "should get library_group_config" do
    LibraryGroup.site_config.should be_truthy
  end

  it "should allow access from allowed networks" do
    library_group = LibraryGroup.find(1)
    library_group.my_networks = "127.0.0.1"
    library_group.network_access_allowed?("192.168.0.1").should be_falsy
  end
end

# == Schema Information
#
# Table name: library_groups
#
#  id                            :integer          not null, primary key
#  name                          :string           not null
#  display_name                  :text
#  short_name                    :string           not null
#  my_networks                   :text
#  old_login_banner              :text
#  note                          :text
#  country_id                    :integer
#  position                      :integer
#  created_at                    :datetime
#  updated_at                    :datetime
#  admin_networks                :text
#  allow_bookmark_external_url   :boolean          default(FALSE), not null
#  url                           :string           default("http://localhost:3000/")
#  settings                      :text
#  html_snippet                  :text
#  book_jacket_source            :string
#  max_number_of_results         :integer          default(500)
#  family_name_first             :boolean          default(TRUE)
#  screenshot_generator          :string
#  pub_year_facet_range_interval :integer          default(10)
#  user_id                       :integer
#  csv_charset_conversion        :boolean          default(FALSE), not null
#  header_logo_file_name         :string
#  header_logo_content_type      :string
#  header_logo_file_size         :integer
#  header_logo_updated_at        :datetime
#  header_logo_meta              :text
#
