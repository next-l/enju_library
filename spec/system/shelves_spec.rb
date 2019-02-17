require 'rails_helper'

RSpec.describe 'Shelves', type: :system do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  describe 'When logged in as Administrator' do
    before do
      sign_in users(:admin)
    end

    it 'should show shelf config' do
      visit shelf_path(shelves(:shelf_00002).id, locale: :ja)
      expect(page).to have_content '新規作成'
    end
  end

  describe 'When logged in as Librarian' do
    before do
      sign_in users(:librarian1)
    end

    it 'should not show shelf config' do
      visit shelf_path(shelves(:shelf_00002).id, locale: :ja)
      expect(page).not_to have_content '新規作成'
    end
  end

  describe 'When logged in as User' do
    before do
      sign_in users(:user1)
    end

    it 'should not show shelf config' do
      visit shelf_path(shelves(:shelf_00002).id, locale: :ja)
      expect(page).not_to have_content '新規作成'
    end
  end

  describe 'When not logged in' do
    it 'should not show shelf config' do
      visit shelf_path(shelves(:shelf_00002).id, locale: :ja)
      expect(page).not_to have_content '新規作成'
    end
  end
end
