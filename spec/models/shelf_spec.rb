# frozen_string_literal: true

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
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  display_name_translations :jsonb            not null
#  note                      :text
#  library_id                :bigint           not null
#  items_count               :integer          default(0), not null
#  position                  :integer          default(1), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  closed                    :boolean          default(FALSE), not null
#
