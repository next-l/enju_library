require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BudgetTypesController do
  fixtures :all
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # BudgetType. As you add validations to BudgetType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for(:budget_type)
  end

  describe "GET index" do
    it "assigns all budget_types as @budget_types" do
      budget_type = BudgetType.create! valid_attributes
      get :index
      assigns(:budget_types).should eq(BudgetType.order(:position))
    end
  end

  describe "GET show" do
    it "assigns the requested budget_type as @budget_type" do
      budget_type = BudgetType.create! valid_attributes
      get :show, :id => budget_type.id
      assigns(:budget_type).should eq(budget_type)
    end
  end

  describe "GET new" do
    it "assigns a new budget_type as @budget_type" do
      get :new
      assigns(:budget_type).should be_a_new(BudgetType)
    end
  end

  describe "GET edit" do
    it "assigns the requested budget_type as @budget_type" do
      budget_type = BudgetType.create! valid_attributes
      get :edit, :id => budget_type.id
      assigns(:budget_type).should eq(budget_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BudgetType" do
        expect {
          post :create, :budget_type => valid_attributes
        }.to change(BudgetType, :count).by(1)
      end

      it "assigns a newly created budget_type as @budget_type" do
        post :create, :budget_type => valid_attributes
        assigns(:budget_type).should be_a(BudgetType)
        assigns(:budget_type).should be_persisted
      end

      it "redirects to the created budget_type" do
        post :create, :budget_type => valid_attributes
        response.should redirect_to(BudgetType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved budget_type as @budget_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetType.any_instance.stub(:save).and_return(false)
        post :create, :budget_type => {}
        assigns(:budget_type).should be_a_new(BudgetType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetType.any_instance.stub(:save).and_return(false)
        post :create, :budget_type => {}
        #response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested budget_type" do
        budget_type = BudgetType.create! valid_attributes
        # Assuming there are no other budget_types in the database, this
        # specifies that the BudgetType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BudgetType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => budget_type.id, :budget_type => {'these' => 'params'}
      end

      it "assigns the requested budget_type as @budget_type" do
        budget_type = BudgetType.create! valid_attributes
        put :update, :id => budget_type.id, :budget_type => valid_attributes
        assigns(:budget_type).should eq(budget_type)
      end

      it "redirects to the budget_type" do
        budget_type = BudgetType.create! valid_attributes
        put :update, :id => budget_type.id, :budget_type => valid_attributes
        response.should redirect_to(budget_type)
      end

      it "moves its position when specified" do
        budget_type = BudgetType.create! valid_attributes
        position = budget_type.position
        put :update, :id => budget_type.id, :move => 'higher'
        response.should redirect_to budget_types_url
        assigns(:budget_type).position.should eq position - 1
      end
    end

    describe "with invalid params" do
      it "assigns the budget_type as @budget_type" do
        budget_type = BudgetType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetType.any_instance.stub(:save).and_return(false)
        put :update, :id => budget_type.id, :budget_type => {}
        assigns(:budget_type).should eq(budget_type)
      end

      it "re-renders the 'edit' template" do
        budget_type = BudgetType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetType.any_instance.stub(:save).and_return(false)
        put :update, :id => budget_type.id, :budget_type => {}
        #response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested budget_type" do
      budget_type = BudgetType.create! valid_attributes
      expect {
        delete :destroy, :id => budget_type.id
      }.to change(BudgetType, :count).by(-1)
    end

    it "redirects to the budget_types list" do
      budget_type = BudgetType.create! valid_attributes
      delete :destroy, :id => budget_type.id
      response.should redirect_to(budget_types_url)
    end
  end

end
