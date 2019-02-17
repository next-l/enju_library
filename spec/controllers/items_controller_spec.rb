require 'rails_helper'

RSpec.describe WithdrawsController, type: :controller do
  fixtures :all

  describe 'GET #show' do
    before do
      @withdraw = FactoryBot.create(:withdraw)
    end

    describe 'When logged in as Librarian' do
      login_fixture_librarian
      it 'should show withdrawn item' do
        get :show, params: { id: @withdraw.to_param }
        response.should be_successful
      end
    end

    describe 'When logged in as User' do
      login_fixture_user
      it 'should show withdrawn item' do
        get :show, params: { id: @withdraw.to_param }
        response.should be_forbidden
      end
    end

    describe 'When not logged in' do
      it 'should show withdrawn item' do
        item = FactoryBot.create(:item)
        get :show, params: { id: @withdraw.to_param }
        response.should redirect_to new_user_session_url
      end
    end
  end
end
