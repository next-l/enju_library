class BudgetTypesController < ApplicationController
  before_action :set_budget_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /budget_types
  def index
    authorize BudgetType
    @budget_types = policy_scope(BudgetType).order(:position)
  end

  # GET /budget_types/1
  def show
  end

  # GET /budget_types/new
  def new
    @budget_type = BudgetType.new
    authorize @budget_type
  end

  # GET /budget_types/1/edit
  def edit
  end

  # POST /budget_types
  def create
    @budget_type = BudgetType.new(budget_type_params)
    authorize @budget_type

    if @budget_type.save
      redirect_to @budget_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.budget_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /budget_types/1
  def update
    if params[:move]
      move_position(@budget_type, params[:move])
      return
    end
    if @budget_type.update(budget_type_params)
      redirect_to @budget_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.budget_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /budget_types/1
  def destroy
    @budget_type.destroy
    redirect_to budget_types_url, :notice => t('controller.successfully_deleted', :model => t('activerecord.models.budget_type'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_type
      @budget_type = BudgetType.find(params[:id])
      authorize @budget_type
    end

    # Only allow a trusted parameter "white list" through.
    def budget_type_params
      params.require(:budget_type).permit(:name, :display_name, :note)
    end
end
