require 'rails_helper'

describe Library do
  fixtures :all

  before(:each) do
    @library = FactoryBot.create(:library)
  end

  it 'should should create default shelf' do
    @library.shelves.first.should be_truthy
    @library.shelves.first.name.should eq "#{@library.name}_default"
  end
end

# == Schema Information
#
# Table name: libraries
#
#  id                              :uuid             not null, primary key
#  name                            :string           not null
#  display_name_translations       :jsonb
#  short_display_name_translations :jsonb
#  zip_code                        :string
#  street                          :text
#  locality                        :text
#  region                          :text
#  telephone_number_1              :string
#  telephone_number_2              :string
#  fax_number                      :string
#  note                            :text
#  call_number_rows                :integer          default(1), not null
#  call_number_delimiter           :string           default("|"), not null
#  library_group_id                :uuid             not null
#  users_count                     :integer          default(0), not null
#  position                        :integer
#  country_id                      :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  opening_hour                    :text
#  isil                            :string
#  latitude                        :float
#  longitude                       :float
#  in_use                          :boolean          default(FALSE), not null
#
