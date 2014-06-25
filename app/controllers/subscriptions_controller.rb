class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_action :get_work
  after_action :verify_authorized
  #after_action :verify_policy_scoped, :only => :index

  # GET /subscriptions
  def index
    authorize Subscription
    if @work
      @subscriptions = @work.subscriptions.page(params[:page])
    else
      @subscriptions = Subscription.page(params[:page])
    end
  end

  # GET /subscriptions/1
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    authorize @subscription
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)
    authorize @subscription
    @subscription.user = current_user

    if @subscription.save
      redirect_to @subscription, :notice => t('controller.successfully_created', :model => t('activerecord.models.subscription'))
    else
      render :action => "new"
    end
  end

  # PUT /subscriptions/1
  def update
    @subscription.assign_attributes(subscription_params)
    if @subscription.save
      redirect_to @subscription, :notice => t('controller.successfully_updated', :model => t('activerecord.models.subscription'))
    else
      render :action => "edit"
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
    redirect_to subscriptions_url
  end

  private
  def set_subscription
    @subscription = Subscription.find(params[:id])
    authorize @subscription
  end

  def subscription_params
    params.require(:subscription).permit(
      :title, :note, :order_list_id, :user_id
    )
  end
end
