class BudgetTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => [:index, :create]
  authorize_resource :only => [:index, :create]

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

  private
  def budget_type_params
    params.require(:budget_type).permit(
      :name, :display_name, :note
    )
  end
end
