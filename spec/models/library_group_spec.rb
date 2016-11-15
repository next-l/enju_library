# -*- encoding: utf-8 -*-
require 'spec_helper'

describe LibraryGroup do
  fixtures :library_groups

  it 'should get library_group_config' do
    LibraryGroup.site_config.should be_truthy
  end

  it 'should allow access from allowed networks' do
    library_group = LibraryGroup.find(1)
    library_group.my_networks = '127.0.0.1'
    library_group.network_access_allowed?('192.168.0.1').should be_falsy
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
#  login_banner                  :text
#  note                          :text
#  country_id                    :integer
#  position                      :integer
#  created_at                    :datetime
#  updated_at                    :datetime
#  admin_networks                :text
#  url                           :string           default("http://localhost:3000/")
#  settings                      :jsonb
#  footer_banner                 :jsonb
#  html_snippet                  :text
#  max_number_of_results         :integer          default(500)
#  family_name_first             :boolean          default(TRUE)
#  pub_year_facet_range_interval :integer          default(10)
#  user_id                       :integer
#
