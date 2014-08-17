class BudgetTypesController < ApplicationController
  load_and_authorize_resource
  # GET /budget_types
  # GET /budget_types.json
  def index
    @budget_types = BudgetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budget_types }
    end
  end

  # GET /budget_types/1
  # GET /budget_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @budget_type }
    end
  end

  # GET /budget_types/new
  # GET /budget_types/new.json
  def new
    @budget_type = BudgetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget_type }
    end
  end

  # GET /budget_types/1/edit
  def edit
  end

  # POST /budget_types
  # POST /budget_types.json
  def create
    @budget_type = BudgetType.new(params[:budget_type])

    respond_to do |format|
      if @budget_type.save
        format.html { redirect_to @budget_type, notice:  t('controller.successfully_created', model:  t('activerecord.models.budget_type')) }
        format.json { render json: @budget_type, status: :created, location: @budget_type }
      else
        format.html { render action: "new" }
        format.json { render json: @budget_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /budget_types/1
  # PUT /budget_types/1.json
  def update
    if params[:move]
      move_position(@budget_type, params[:move])
      return
    end

    respond_to do |format|
      if @budget_type.update_attributes(params[:budget_type])
        format.html { redirect_to @budget_type, notice:  t('controller.successfully_updated', model:  t('activerecord.models.budget_type')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_types/1
  # DELETE /budget_types/1.json
  def destroy
    @budget_type.destroy

    respond_to do |format|
      format.html { redirect_to budget_types_url, notice: t('controller.successfully_deleted', model: t('activerecord.models.budget_type')) }
      format.json { head :no_content }
    end
  end
end
