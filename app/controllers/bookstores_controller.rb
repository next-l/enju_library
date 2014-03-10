class BookstoresController < ApplicationController
  before_action :set_bookstore, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, :only => :index

  # GET /bookstores
  def index
    authorize Bookstore
    @bookstores = Bookstore.order(:position).page(params[:page])
  end

  # GET /bookstores/1
  def show
  end

  # GET /bookstores/new
  def new
    @bookstore = Bookstore.new
    authorize @bookstore
  end

  # GET /bookstores/1/edit
  def edit
  end

  # POST /bookstores
  def create
    @bookstore = Bookstore.new(bookstore_params)
    authorize @bookstore

    if @bookstore.save
      redirect_to @bookstore, notice:  t('controller.successfully_created', :model => t('activerecord.models.bookstore'))
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /bookstores/1
  def update
    if params[:move]
      move_position(@bookstore, params[:move])
      return
    end
    if @bookstore.update(bookstore_params)
      redirect_to @bookstore, notice:  t('controller.successfully_updated', :model => t('activerecord.models.bookstore'))
    else
      render action: 'edit'
    end
  end

  # DELETE /bookstores/1
  def destroy
    @bookstore.destroy
    redirect_to bookstores_url, :notice => t('controller.successfully_deleted', :model => t('activerecord.models.bookstore'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookstore
      @bookstore = Bookstore.find(params[:id])
      authorize @bookstore
    end

    # Only allow a trusted parameter "white list" through.
    def bookstore_params
      params.require(:bookstore).permit(:name, :display_name, :note)
    end
end
