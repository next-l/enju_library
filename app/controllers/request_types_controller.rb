class RequestTypesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource

  def update
    @request_type = RequestType.find(params[:id])
    if params[:move]
      move_position(@request_type, params[:move])
      return
    end
    update!
  end
end
