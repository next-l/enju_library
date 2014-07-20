class AcceptsController < ApplicationController
  before_action :set_accept, only: [:show, :edit, :update, :destroy]
  before_action :get_basket, :only => [:index, :create]
  after_action :verify_authorized
  #after_action :verify_policy_scoped, :only => :index

  # GET /accepts
  def index
    authorize Accept
    if params[:format] == 'txt'
      @accepts = Accept.order('accepts.created_at DESC').page(params[:page]).per(65534)
    else
      if params[:accept]
        @query = params[:accept][:item_identifier].to_s.strip
        item = Item.where(:item_identifier => @query).first if @query.present?
      end

      if item
        @accepts = Accept.order('accepts.created_at DESC').where(:item_id => item.id).page(params[:page])
      else
        if @basket
          @accepts = @basket.accepts.page(params[:page])
        else
          @accepts = Accept.page(params[:page])
        end
      end
    end
  end

  # GET /accepts/1
  def show
  end

  # GET /accepts/new
  def new
    @accept = Accept.new
    authorize @accept
    @basket = Basket.new
    @basket.user = current_user
    @basket.save!
    @accepts = []
  end

  # GET /accepts/1/edit
  def edit
  end

  # POST /accepts
  def create
    authorize Accept
    unless @basket
      access_denied; return
    end
    @accept = Accept.new(accept_params)

    @accept.basket = @basket
    @accept.librarian = current_user

    flash[:message] = ''
    if @accept.item_identifier.blank?
      flash[:message] << t('accept.enter_item_identifier') if @accept.item_identifier.blank?
    else
      item = Item.where(:item_identifier => @accept.item_identifier.to_s.strip).first
    end
    @accept.item = item

    respond_to do |format|
      if @accept.save
        flash[:message] << t('accept.successfully_accepted', :model => t('activerecord.models.accept'))
        format.html {redirect_to basket_accepts_url(@basket), notice: 'Accept was successfully created.'}
        format.json { render :json => @accept, :status => :created, :location => @accept }
        format.js { redirect_to basket_accepts_url(@basket, :format => :js) }
      else
        @accepts = @basket.accepts.page(params[:page])
        format.html { render :action => "index" }
        format.json { render :json => @accept.errors, :status => :unprocessable_entity }
        format.js { render :action => "index" }
      end
    end
  end

  # PATCH/PUT /accepts/1
  def update
    if @accept.update(accept_params)
      redirect_to @accept, notice: 'Accept was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /accepts/1
  def destroy
    @accept.destroy
    redirect_to accepts_url, notice: 'Accept was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accept
      @accept = Accept.find(params[:id])
      authorize @accept
    end

    # Only allow a trusted parameter "white list" through.
    def accept_params
      params.require(:accept).permit(:item_identifier, :librarian_id, :item_id)
    end
end
