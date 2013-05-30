class SearchEnginesController < InheritedResources::Base
  respond_to :html, :json
  load_and_authorize_resource

  def update
    @search_engine = SearchEngine.find(params[:id])
    if params[:move]
      move_position(@search_engine, params[:move])
      return
    end
    update!
  end

  def index
    @search_engines = SearchEngine.page(params[:page])
  end
end
