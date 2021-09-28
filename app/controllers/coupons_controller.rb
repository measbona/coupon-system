class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @status = %w"inactive, active"
    @coupon_type = %w"percentage amount"

    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
     
    if @coupon.save
      redirect_to @coupon
    else
      render :new
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])

    if Coupon.update(coupon_params)
      redirect_to @coupon
    else
      render :edit
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    redirect_to root_path
  end

  private
    def coupon_params
      params.require(:coupon).permit(:coupon_code, :coupon_type, :value,
                                    :published_at, :valid_until, :status)
    end
end
