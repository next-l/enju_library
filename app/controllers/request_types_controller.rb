class RequestTypesController < ApplicationController
  before_action :set_request_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /request_types
  def index
    authorize RequestType
    @request_types = policy_scope(RequestType)
  end

  # GET /request_types/1
  def show
  end

  # GET /request_types/new
  def new
    @request_type = RequestType.new
    authorize @request_type
  end

  # GET /request_types/1/edit
  def edit
  end

  # POST /request_types
  def create
    @request_type = RequestType.new(request_type_params)
    authorize @request_type

    if @request_type.save
      redirect_to @request_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.request_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /request_types/1
  def update
    if params[:move]
      move_position(@request_type, params[:move])
      return
    end
    if @request_type.update(request_type_params)
      redirect_to @request_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.request_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /request_types/1
  def destroy
    @request_type.destroy
    redirect_to request_types_url, notice: 'Request type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_type
      @request_type = RequestType.find(params[:id])
      authorize @request_type
    end

    # Only allow a trusted parameter "white list" through.
    def request_type_params
      params.require(:request_type).permit(:name, :display_name, :note)
    end
end
