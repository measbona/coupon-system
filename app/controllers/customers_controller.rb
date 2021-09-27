class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  # def new
  #   @coupon = Customer.new
  # end

  # def create
  #   @coupon = Customer.new(coupon_params)
     
  #   if @coupon.save
  #     redirect_to @coupon
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @coupon = Customer.find(params[:id])
  # end

  # def update
  #   @coupon = Customer.find(params[:id])

  #   if Customer.update(coupon_params)
  #     redirect_to @coupon
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @coupon = Customer.find(params[:id])
    @coupon.destroy

    redirect_to root_path
  end

  # private
    # def coupon_params
    #   params.require(:coupon).permit(:coupon_code, :coupon_type, :value,
    #                                 :published_at, :valid_until, :status)
    # end
end
