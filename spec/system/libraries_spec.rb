require 'rails_helper'

RSpec.describe 'Libraries', type: :system do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  describe 'When logged in as Administrator' do
    before do
      sign_in users(:admin)
    end

    it 'should show library config' do
      visit library_path(libraries(:library_00002).id, locale: :ja)
      expect(page).to have_content '設定'
    end
  end

  describe 'When logged in as Librarian' do
    before do
      sign_in users(:librarian1)
    end

    it 'should not show library config' do
      visit library_path(libraries(:library_00002).id, locale: :ja)
      expect(page).not_to have_content '設定'
    end
  end

  describe 'When logged in as User' do
    before do
      sign_in users(:user1)
    end

    it 'should not show library config' do
      visit library_path(libraries(:library_00002).id, locale: :ja)
      expect(page).not_to have_content '設定'
    end
  end

  describe 'When not logged in' do
    it 'should not show library config' do
      visit library_path(libraries(:library_00002).id, locale: :ja)
      expect(page).not_to have_content '設定'
    end
  end
end
