# frozen_string_literal: true

require 'rails_helper'

describe RequestStatusType do
  #pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: request_status_types
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  display_name_translations :jsonb            not null
#  note                      :text
#  position                  :integer          default(1), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
