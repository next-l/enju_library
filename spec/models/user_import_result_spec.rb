# frozen_string_literal: true

require 'rails_helper'

describe UserImportResult do
  #pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: user_import_results
#
#  id                  :bigint(8)        not null, primary key
#  user_import_file_id :bigint(8)
#  user_id             :bigint(8)
#  body                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  error_message       :text
#
