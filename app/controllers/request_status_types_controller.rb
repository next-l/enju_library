class RequestStatusTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => [:index, :create]
  authorize_resource :only => [:index, :create]

  def update
    @request_status_type = RequestStatusType.find(params[:id])
    if params[:move]
      move_position(@request_status_type, params[:move])
      return
    end
    update!
  end

  private
  def permitted_params
    params.permit(
      :request_status_type => [:name, :display_name, :note]
    )
  end
end
