# -*- encoding: utf-8 -*-
require 'rails_helper'

describe BudgetType do
  it 'should create budget_type' do
    FactoryBot.create(:budget_type)
  end
end

# == Schema Information
#
# Table name: budget_types
#
#  id                        :bigint           not null, primary key
#  name                      :string
#  display_name              :text
#  note                      :text
#  position                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  display_name_translations :jsonb            not null
#
