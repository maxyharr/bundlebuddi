  class BundlesController < ApplicationController
  before_action :set_bundle, only: [:show, :edit, :update, :destroy]

  # GET /bundles
  # GET /bundles.json
  def index
    @bundles = Bundle.all
  end

  # GET /bundles/1
  # GET /bundles/1.json
  def show
    @subscriptions = @bundle.subscriptions
  end

  # GET /bundles/new
  def new
    @subscriptions = Subscription.all
    @bundle = Bundle.new
  end

  # GET /bundles/1/edit
  def edit
  end

  # POST /bundles
  # POST /bundles.json
  def create
    @bundle = Bundle.create

    bundle_subscriptions = []
    bundle_params[:bundle_subscriptions].each do |subscription_id|
      bundle_subscriptions << BundleSubscription.new(bundle_id: @bundle.id, subscription_id: subscription_id)
    end
    puts "bundle_subscriptions: #{bundle_subscriptions}"

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
    respond_to do |format|
      if @bundle.update(bundle_params)
        format.html { redirect_to @bundle, notice: 'Bundle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bundle }
      else
        format.html { render :edit }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_bundle
      @bundle = Bundle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bundle_params
      params.require(:bundle).permit(bundle_subscriptions: [])
    end
end
