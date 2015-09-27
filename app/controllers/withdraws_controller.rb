class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: [:index, :new, :create]
  before_action :get_basket, only: [:index, :create]

  # GET /withdraws
  def index
    if params[:format] == 'txt'
      @withdraws = Withdraw.order('withdraws.created_at DESC').page(params[:page]).per(65534)
    else
      if params[:withdraw]
        @query = params[:withdraw][:item_identifier].to_s.strip
        item = Item.where(item_identifier: @query).first if @query.present?
      end

      if item
        @withdraws = Withdraw.order('withdraws.created_at DESC').where(item_id: item.id).page(params[:page])
      else
        if @basket
          @withdraws = @basket.withdraws.order('withdraws.created_at DESC').page(params[:page])
        else
          @withdraws = Withdraw.order(created_at: :desc).page(params[:page])
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @withdraws }
      format.js { @withdraw = Withdraw.new }
      format.txt
    end
  end

  # GET /withdraws/1
  def show
  end

  # GET /withdraws/new
  def new
    @basket = Basket.new
    @basket.user = current_user
    @basket.save!
    @withdraw = Withdraw.new
    @withdraws = []
  end

  # GET /withdraws/1/edit
  def edit
  end

  # POST /withdraws
  def create
    @withdraw = Withdraw.new(withdraw_params)

    if @withdraw.save
      redirect_to @withdraw, notice: 'Withdraw was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /withdraws/1
  def update
    if @withdraw.update(withdraw_params)
      redirect_to @withdraw, notice: 'Withdraw was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /withdraws/1
  def destroy
    @withdraw.destroy
    redirect_to withdraws_url, notice: 'Withdraw was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw
      @withdraw = Withdraw.find(params[:id])
      authorize @withdraw
    end

    # Only allow a trusted parameter "white list" through.
    def withdraw_params
      params.require(:withdraw).permit(:basket_id, :item_id, :librarian_id)
    end

    def check_policy
      authorize Withdraw
    end
end
