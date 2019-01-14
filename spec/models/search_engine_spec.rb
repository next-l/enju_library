# -*- encoding: utf-8 -*-
require 'rails_helper'

describe SearchEngine do
  fixtures :search_engines

  it "should respond to search_params" do
    search_engines(:search_engine_00001).search_params('test').should eq({submit: 'Search', locale: 'ja', keyword: 'test'})
  end
end

# == Schema Information
#
# Table name: search_engines
#
#  id               :bigint(8)        not null, primary key
#  name             :string           not null
#  display_name     :jsonb            not null
#  url              :string           not null
#  base_url         :text             not null
#  http_method      :text             not null
#  query_param      :text             not null
#  additional_param :text
#  note             :text
#  position         :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
