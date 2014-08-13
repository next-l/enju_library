class AcceptsController < InheritedResources::Base
  load_and_authorize_resource :except => :index
  authorize_resource :only => :index
  respond_to :html, :json
  before_filter :get_basket, :only => [:index, :create]

  # GET /accepts
  # GET /accepts.json
  def index
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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accepts }
      format.js { @accept = Accept.new }
      format.txt
    end
  end

  # GET /new
  # GET /new.json
  def new
    @basket = Basket.new
    @basket.user = current_user
    @basket.save!
    @accept = Accept.new
    @accepts = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accept }
    end
  end

  # POST /accepts
  # POST /accepts.json
  def create
    unless @basket
      access_denied; return
    end
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
        format.html { redirect_to accepts_url(basket_id: @basket.id) }
        format.json { render json: @accept, status: :created, :location => @accept }
        format.js { redirect_to accepts_url(basket_id: @basket.id, :format => :js) }
      else
        @accepts = @basket.accepts.page(params[:page])
        format.html { render action: "index" }
        format.json { render json: @accept.errors, status: :unprocessable_entity }
        format.js { render action: "index" }
      end
    end
  end
end
