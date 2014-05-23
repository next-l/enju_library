class SearchEnginesController < ApplicationController
  before_action :set_search_engine, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  #after_action :verify_policy_scoped, :only => :index

  # GET /search_engines
  def index
    authorize SearchEngine
    @search_engines = SearchEngine.order(:position)
  end

  # GET /search_engines/1
  def show
  end

  # GET /search_engines/new
  def new
    @search_engine = SearchEngine.new
    authorize @search_engine
  end

  # GET /search_engines/1/edit
  def edit
  end

  # POST /search_engines
  def create
    @search_engine = SearchEngine.new(search_engine_params)
    authorize @search_engine

    if @search_engine.save
      redirect_to @search_engine, notice:  t('controller.successfully_created', :model => t('activerecord.models.search_engine'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /search_engines/1
  def update
    if params[:move]
      move_position(@search_engine, params[:move])
      return
    end
    if @search_engine.update(search_engine_params)
      redirect_to @search_engine, notice:  t('controller.successfully_updated', :model => t('activerecord.models.search_engine'))
    else
      render action: 'edit'
    end
  end

  # DELETE /search_engines/1
  def destroy
    @search_engine.destroy
    redirect_to search_engines_url, :notice => t('controller.successfully_destroyed', :model => t('activerecord.models.search_engine'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_engine
      @search_engine = SearchEngine.find(params[:id])
      authorize @search_engine
    end

    # Only allow a trusted parameter "white list" through.
    def search_engine_params
      params.require(:search_engine).permit(
        :name, :display_name, :url, :base_url, :http_method,
        :query_param, :additional_param, :note
      )
    end
end
