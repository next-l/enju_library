class BudgetTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => :index
  authorize_resource :only => :index

  def index
    @budget_types = BudgetType.order(:position)
  end

  def update
    @budget_type = BudgetType.find(params[:id])
    if params[:move]
      move_position(@budget_type, params[:move])
      return
    end
    update!
  end
end
