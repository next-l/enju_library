class RequestTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource :except => [:index, :create]
  authorize_resource :only => [:index, :create]

  def update
    @request_type = RequestType.find(params[:id])
    if params[:move]
      move_position(@request_type, params[:move])
      return
    end
    update!
  end

  private
  def request_type_params
    params.require(:request_type).permit(
      :name, :display_name, :note
    )
  end
end
