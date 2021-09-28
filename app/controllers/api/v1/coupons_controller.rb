class Api::V1::CouponsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @limit = params[:limit] ? params[:limit] : 10

    @coupons = Coupon.limit(@limit)

    render json: @coupons
  end

  def show
    @coupon = find_coupon

    if @coupon.present?
      render json: @coupon
    else
      render json: { message: "Coupon not found" }, status: 404
    end
  end

  def new
    @coupon = Coupon.new(coupon_params)

    if @coupon.save(:validate => false)
      render json: @coupon
    else
      render error: { error: "Error while creating coupon" }, status: 400
    end
  end

  def update
    @coupon = find_coupon
    @coupon.update(coupon_params)

    if @coupon.save(:validate => false)
      render json: @coupon
    else
      render error: { error: "Error while updating coupon" }, status: 400
    end
  end

  def destroy
    @coupon = find_coupon

    if @coupon.present?
      @coupon.destroy

      render json: { message: "#{@coupon.coupon_code} destroy" }, status: 200
    else
      render json: { message: "Coupon not found" }, status: 404
    end
  end

  private
    def coupon_params
      params.require(:coupon).permit(:coupon_code, :coupon_type, :value,
                                    :published_at, :valid_until, :status)
    end

    def find_coupon
      @coupon_id = params[:id]

      @coupon = Coupon.find_by(id: @coupon_id)
    end
end
