class WithdrawsController < ApplicationController
  load_and_authorize_resource except: :index
  authorize_resource only: :index
  before_filter :get_basket, only: [:index, :create]

  # GET /withdraws
  def index
    @withdraws = Withdraw.all
  end

  # GET /withdraws/1
  def show
  end

  # GET /withdraws/new
  def new
    @withdraw = Withdraw.new
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
    end

    # Only allow a trusted parameter "white list" through.
    def withdraw_params
      params.require(:withdraw).permit(:basket_id, :item_id, :librarian_id)
    end
end
