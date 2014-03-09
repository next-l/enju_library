class RequestStatusTypesController < ApplicationController
  before_action :set_request_status_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /request_status_types
  def index
    authorize RequestStatusType
    @request_status_types = policy_scope(RequestStatusType)
  end

  # GET /request_status_types/1
  def show
  end

  # GET /request_status_types/new
  def new
    @request_status_type = RequestStatusType.new
    authorize @request_status_type
  end

  # GET /request_status_types/1/edit
  def edit
  end

  # POST /request_status_types
  def create
    @request_status_type = RequestStatusType.new(request_status_type_params)
    authorize @request_status_type

    if @request_status_type.save
      redirect_to @request_status_type, notice:  t('controller.successfully_created', :model => t('activerecord.models.request_status_type'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /request_status_types/1
  def update
    if params[:move]
      move_position(@request_status_type, params[:move])
      return
    end
    if @request_status_type.update(request_status_type_params)
      redirect_to @request_status_type, notice:  t('controller.successfully_updated', :model => t('activerecord.models.request_status_type'))
    else
      render action: 'edit'
    end
  end

  # DELETE /request_status_types/1
  def destroy
    @request_status_type.destroy
    redirect_to request_status_types_url, notice: 'Request type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_status_type
      @request_status_type = RequestStatusType.find(params[:id])
      authorize @request_status_type
    end

    # Only allow a trusted parameter "white list" through.
    def request_status_type_params
      params.require(:request_status_type).permit(:name, :display_name, :note)
    end
end
