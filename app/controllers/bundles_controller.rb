  class BundlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bundle, only: [:show, :edit, :update, :destroy]

  # GET /bundles
  # GET /bundles.json
  def index
    @bundles = current_user.bundle
  end

  # GET /bundles/1
  # GET /bundles/1.json
  def show
    @subscriptions = @bundle.subscriptions
    @prebundled_cost = @bundle.prebundled_cost_in_cents/100.0
  end

  # GET /bundles/new
  def new
    @subscriptions = Subscription.all
    @bundle = Bundle.new
  end

  # GET /bundles/1/edit
  def edit
    @subscriptions = Subscription.all
    @bundled_subscriptions = @bundle.subscriptions
    @prebundled_cost = @bundle.prebundled_cost_in_cents/100.0
  end

  # POST /bundles
  # POST /bundles.json
  def create
    @bundle = Bundle.create user: current_user
    bundle_subscriptions = create_bundle_subs

    if BundleSubscription.import(bundle_subscriptions)
      redirect_to @bundle, notice: 'Bundle was successfully created.'
    else
      @bundle.destroy
      render :new
    end
  end

  # PATCH/PUT /bundles/1
  # PATCH/PUT /bundles/1.json
  def update
    bundle_subscriptions = create_bundle_subs
    if BundleSubscription.import(bundle_subscriptions)
      @bundle.bundle_subscriptions.where.not(id: bundle_subscriptions).destroy_all
      redirect_to @bundle, notice: 'Bundle was successfully updated.'
    else
      edit
      flash[:alert] = 'Something went wrong while updating your bundle. Please try again.'
      render :edit and return
    end
  end

  # DELETE /bundles/1
  # DELETE /bundles/1.json
  def destroy
    @bundle.destroy
    respond_to do |format|
      format.html { redirect_to bundles_url, notice: 'Bundle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def create_bundle_subs
      bundle_subscriptions = []
      bundle_params[:bundle_subscriptions].each do |subscription_id|
        bundle_subscriptions << BundleSubscription.new(bundle_id: @bundle.id, subscription_id: subscription_id)
      end
      bundle_subscriptions
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bundle
      @bundle = Bundle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bundle_params
      params.require(:bundle).permit(bundle_subscriptions: [])
    end
end
