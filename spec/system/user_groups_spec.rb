require 'rails_helper'

RSpec.describe 'UserGroups', type: :system do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  describe 'When logged in as Administrator' do
    before do
      sign_in users(:admin)
    end

    it 'should show user_group config' do
      visit user_group_path(user_groups(:user_group_00002).id, locale: :ja)
      expect(page).to have_content '編集'
    end
  end

  describe 'When logged in as Librarian' do
    before do
      sign_in users(:librarian1)
    end

    it 'should not show user_group config' do
      visit user_group_path(user_groups(:user_group_00002).id, locale: :ja)
      expect(page).not_to have_content '編集'
    end
  end

  describe 'When logged in as User' do
    before do
      sign_in users(:user1)
    end

    it 'should not show user_group config' do
      visit user_group_path(user_groups(:user_group_00002).id, locale: :ja)
      expect(page).not_to have_content '編集'
    end
  end

  describe 'When not logged in' do
    it 'should not show user_group config' do
      visit user_group_path(user_groups(:user_group_00002).id, locale: :ja)
      expect(page).not_to have_content '編集'
    end
  end
end
