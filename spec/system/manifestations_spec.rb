require 'rails_helper'

RSpec.describe 'Manifestations', type: :system do
  include Devise::Test::IntegrationHelpers
  fixtures :all
  before do
    @manifestation = manifestations(:manifestation_00001)
    @item = FactoryBot.create(:item, manifestation: @manifestation)
    FactoryBot.create(:withdraw, item: @item)
  end

  describe 'When logged in as Librarian' do
    before do
      sign_in users(:librarian1)
    end

    it 'should show withdrawn item' do
      visit manifestation_path(@manifestation.id, locale: :ja)
      expect(page).to have_content @item.item_identifier
    end
  end

  describe 'When logged in as User' do
    before do
      sign_in users(:user1)
    end

    it 'should not show withdrawn item' do
      visit manifestation_path(@manifestation.id, locale: :ja)
      expect(page).not_to have_content @item.item_identifier
    end
  end

  describe 'When not logged in' do
    it 'should not show withdrawn item' do
      visit manifestation_path(@manifestation.id, locale: :ja)
      expect(page).not_to have_content @item.item_identifier
    end
  end
end
