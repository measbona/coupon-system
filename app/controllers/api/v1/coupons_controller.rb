class Api::V1::CouponsController < ApplicationController
  def index
    limit = params[:limit] ? params[:limit] : 10

    coupons = Coupon.limit(limit)

    render json: coupons
  end
end
