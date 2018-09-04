class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create subscription_params
    redirect_to subscriptions_path
  end

  def edit
  end

  def update
    @subscription.update subscription_params
    redirect_to @subscription
  end

  def destroy
    @subscription.destroy
    redirect_to subscriptions_path
  end


  private
    def set_subscription
      @subscription = Subscription.find params[:id]
    end

    def subscription_params
      params.require(:subscription).permit(:name, :cost_in_cents)
    end
end
