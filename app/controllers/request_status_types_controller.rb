class RequestStatusTypesController < ApplicationController
  before_action :set_request_status_type, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: [:index, :new, :create]

  # GET /request_status_types
  # GET /request_status_types.json
  def index
    @request_status_types = RequestStatusType.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_status_types }
    end
  end

  # GET /request_status_types/1
  # GET /request_status_types/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_status_type }
    end
  end

  # GET /request_status_types/new
  # GET /request_status_types/new.json
  def new
    @request_status_type = RequestStatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_status_type }
    end
  end

  # GET /request_status_types/1/edit
  def edit
  end

  # POST /request_status_types
  # POST /request_status_types.json
  def create
    @request_status_type = RequestStatusType.new(request_status_type_params)

    respond_to do |format|
      if @request_status_type.save
        format.html { redirect_to @request_status_type, notice: t('controller.successfully_created', model: t('activerecord.models.request_status_type')) }
        format.json { render json: @request_status_type, status: :created, location: @request_status_type }
      else
        format.html { render action: "new" }
        format.json { render json: @request_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_status_types/1
  # PUT /request_status_types/1.json
  def update
    if params[:move]
      move_position(@request_status_type, params[:move])
      return
    end

    respond_to do |format|
      if @request_status_type.update(request_status_type_params)
        format.html { redirect_to @request_status_type, notice: t('controller.successfully_updated', model: t('activerecord.models.request_status_type')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_status_types/1
  # DELETE /request_status_types/1.json
  def destroy
    @request_status_type.destroy

    respond_to do |format|
      format.html { redirect_to request_status_types_url, notice: t('controller.successfully_deleted', model: t('activerecord.models.request_status_type')) }
      format.json { head :no_content }
    end
  end

  private

  def set_request_status_type
    @request_status_type = RequestStatusType.find(params[:id])
    authorize @request_status_type
  end

  def check_policy
    authorize RequestStatusType
  end

  def request_status_type_params
    params.require(:request_status_type).permit(
      :name, :display_name, :note,
      I18n.available_locales.map{|locale|
        :"display_name_#{locale.to_s}"
      }
    )
  end
end
