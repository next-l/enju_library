class SearchEnginesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource except: :create
  authorize_resource only: :create

  def index
    @search_engines = SearchEngine.page(params[:page])
  end

  def update
    @search_engine = SearchEngine.find(params[:id])
    if params[:move]
      move_position(@search_engine, params[:move])
      return
    end
    update!
  end

  private
  def permitted_params
    params.permit(:search_engine => [
        :name, :display_name, :url, :base_url, :http_method,
        :query_param, :additional_param, :note
      ]
    )
  end
end
