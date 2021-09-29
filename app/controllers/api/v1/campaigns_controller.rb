class Api::V1::CampaignsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @limit = params[:limit] ? params[:limit] : 10

    @campaigns = Campaign.limit(@limit)

    render json: @campaigns
  end

  def show
    @campaign = find_campaign

    if @campaign.present?
      render json: @campaign
    else
      render json: { message: "Campaign not found" }, status: 404
    end
  end
  
  def create
    @campaign = Campaign.new(campaign_params)

    @campaign.started_at = DateTime.now
    @campaign.ended_at = DateTime.now

    if @campaign.save
      render json: @campaign
    else
      render json: { message: "Error while creating campaign" }, status: 500
    end
  end

  def update
    @campaign = find_campaign
    @campaign.update(campaign_params)

    if @campaign.save
      render json: @campaign
    else
      render json: { message: "Error while updating campaign" }, status: 500
    end
  end

  def destroy
    @campaign = find_campaign

    if @campaign.present?
      @campaign.destroy

      render json: { message: "Campaign has been destroy" }
    else
      render json: { message: "Campaign not found" }, status: 404
    end
  end

  def coupons
    render json: campaign_coupon
  end

  def redemptions
    render json: campaign_redemptions
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, :prefix, :suffix, :code_length,
                                      :code_count, :charset)
    end

    def find_campaign
      @campaign_id = params[:id]

      @campaign = Campaign.find_by(id: @campaign_id)
    end

    def campaign_coupons
      @campaign_id = params[:campaign_id]
      @coupons = Campaign.find_by(id: @campaign_id).coupons
    end

    def campaign_redemptions
      @campaign_id = params[:campaign_id]
      @coupons = Campaign.find_by(id: @campaign_id).redemptions
    end
end
