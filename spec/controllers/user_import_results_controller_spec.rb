require 'rails_helper'

describe UserImportResultsController do
  fixtures :all

  describe 'GET index' do
    describe 'When logged in as Administrator' do
      login_fixture_admin

      it 'assigns all user_import_results as @user_import_results' do
        get :index
        assigns(:user_import_results).should eq(UserImportResult.page(1))
      end

      describe 'With @user_import_file parameter' do
        before(:each) do
          @file = UserImportFile.create!(
            user: users(:admin),
            default_user_group: UserGroup.find_by(name: 'user'),
            default_library: libraries(:library_00003)
          )
          @file.user_import.attach(io: File.new("#{Rails.root}/../../examples/user_import_file_sample_long.tsv"), filename: 'attachment.txt')
          @file.import_start
        end
        render_views
        it 'should assign all user_import_results for the user_import_file with a page parameter' do
          get :index, params: { user_import_file_id: @file.id }
          results = assigns(:user_import_results)
          results.should_not be_empty
          response.body.should match /<td>11<\/td>/
        end
      end
    end

    describe 'When logged in as Librarian' do
      login_fixture_librarian

      it 'assigns all user_import_results as @user_import_results' do
        get :index
        assigns(:user_import_results).should eq(UserImportResult.page(1))
      end
    end

    describe 'When logged in as User' do
      login_fixture_user

      it 'assigns empty as @user_import_results' do
        get :index
        assigns(:user_import_results).should be_nil
        response.should be_forbidden
      end
    end

    describe 'When not logged in' do
      it 'assigns empty as @user_import_results' do
        get :index
        assigns(:user_import_results).should be_nil
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe 'GET show' do
    before(:each) do
      @user_import_result = FactoryBot.create(:user_import_result)
    end

    describe 'When logged in as Administrator' do
      login_fixture_admin

      it 'assigns the requested user_import_result as @user_import_result' do
        get :show, params: { id: @user_import_result.id }
        assigns(:user_import_result).should eq(@user_import_result)
      end
    end

    describe 'When logged in as Librarian' do
      login_fixture_librarian

      it 'assigns the requested user_import_result as @user_import_result' do
        get :show, params: { id: @user_import_result.id }
        assigns(:user_import_result).should eq(@user_import_result)
      end
    end

    describe 'When logged in as User' do
      login_fixture_user

      it 'assigns the requested user_import_result as @user_import_result' do
        get :show, params: { id: @user_import_result.id }
        assigns(:user_import_result).should eq(@user_import_result)
        response.should be_forbidden
      end
    end

    describe 'When not logged in' do
      it 'assigns the requested user_import_result as @user_import_result' do
        get :show, params: { id: @user_import_result.id }
        assigns(:user_import_result).should eq(@user_import_result)
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @user_import_result = FactoryBot.create(:user_import_result)
    end

    describe 'When logged in as Administrator' do
      login_fixture_admin

      it 'destroys the requested user_import_result' do
        delete :destroy, params: { id: @user_import_result.id }
      end

      it 'should be forbidden' do
        delete :destroy, params: { id: @user_import_result.id }
        response.should be_forbidden
      end
    end

    describe 'When logged in as Librarian' do
      login_fixture_librarian

      it 'destroys the requested user_import_result' do
        delete :destroy, params: { id: @user_import_result.id }
      end

      it 'should be forbidden' do
        delete :destroy, params: { id: @user_import_result.id }
        response.should be_forbidden
      end
    end

    describe 'When logged in as User' do
      login_fixture_user

      it 'destroys the requested user_import_result' do
        delete :destroy, params: { id: @user_import_result.id }
      end

      it 'should be forbidden' do
        delete :destroy, params: { id: @user_import_result.id }
        response.should be_forbidden
      end
    end

    describe 'When not logged in' do
      it 'destroys the requested user_import_result' do
        delete :destroy, params: { id: @user_import_result.id }
      end

      it 'should be forbidden' do
        delete :destroy, params: { id: @user_import_result.id }
        response.should redirect_to(new_user_session_url)
      end
    end
  end
end
