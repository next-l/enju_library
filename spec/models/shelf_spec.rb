# -*- encoding: utf-8 -*-
require 'rails_helper'

describe Shelf do
  fixtures :all

  it "should respond to web_shelf" do
    shelves(:shelf_00001).web_shelf?.should be_truthy
    shelves(:shelf_00002).web_shelf?.should_not be_truthy
  end
end

# == Schema Information
#
# Table name: shelves
#
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  display_name :text
#  note         :text
#  library_id   :bigint(8)        not null
#  items_count  :integer          default(0), not null
#  position     :integer          default(1), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#  closed       :boolean          default(FALSE), not null
#
