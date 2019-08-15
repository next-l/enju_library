class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: [:index, :new, :create]

  # GET /baskets
  # GET /baskets.json
  def index
    if current_user.has_role?('Librarian')
     @baskets = Basket.page(params[:page])
    else
      redirect_to new_basket_url
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baskets }
    end
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basket }
    end
  end

  # GET /baskets/new
  # GET /baskets/new.json
  def new
    @basket = Basket.new
    @basket.user_number = params[:user_number]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basket }
    end
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)
    @user = Profile.where(user_number: @basket.user_number).first.try(:user) if @basket.user_number.present?
    if @user
      @basket.user = @user
    end

    respond_to do |format|
      if @basket.save
        format.html {
          if defined?(EnjuCirculation)
            redirect_to new_checked_item_url(basket_id: @basket.id), notice: t('controller.successfully_created', model: t('activerecord.models.basket'))
          else
            redirect_to basket_url(@basket), notice: t('controller.successfully_created', model: t('activerecord.models.basket'))
          end
        }
        format.json { render json: @basket, status: :created, location:  @basket }
      else
        format.html { render action: "new" }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /baskets/1
  # PUT /baskets/1.json
  def update
    librarian = current_user
    if defined?(EnjuCirculation)
      begin
        unless @basket.basket_checkout(librarian)
          redirect_to new_checked_item_url(basket_id: @basket.id)
          return
        end
      rescue ActiveRecord::RecordInvalid
        flash[:message] = t('checked_item.already_checked_out_try_again')
        @basket.checked_items.delete_all
        redirect_to new_checked_item_url(basket_id: @basket.id)
        return
      end
    end

    respond_to do |format|
      # if @basket.update_attributes({})
      if @basket.save(validate: false)
        # 貸出完了時
        format.html {
          if defined?(EnjuCirculation)
            redirect_to checkouts_url(user_id: @basket.user.username), notice: t('basket.checkout_completed')
          else
            redirect_to basket_url(@basket), notice: t('basket.checkout_completed')
          end
        }
        format.json { head :no_content }
      else
        format.html {
          if defined?(EnjuCirculation)
            redirect_to checked_items_url(basket_id: @basket.id)
          else
            render action: "edit"
          end
        }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy

    respond_to do |format|
      format.html {
        if defined?(EnjuCirculation)
          redirect_to checkouts_url(user_id: @basket.user.username)
        else
          redirect_to baskets_url
        end
      }
      format.json { head :no_content }
    end
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
    authorize @basket
  end

  def check_policy
    authorize Basket
  end

  def basket_params
    params.require(:basket).permit(:note, :user_number)
  end
end
