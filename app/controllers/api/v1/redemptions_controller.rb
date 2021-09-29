class Api::V1::RedemptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @limit = params[:limit] ? params[:limit] : 10

    @redemptions = Redemption.limit(@limit)

    render json: @redemptions
  end

  def show
    @redemption = find_redemption

    if @redemption.present?
      render json: @redemption
    else
      render json: { message: "Redemption not found" }, status: 404
    end
  end

  def create
    @order = find_order
    @coupon = find_coupon
    @customer = find_customer
    @order_total = @order.amount

    @redemption = Redemption.new(customer: @customer, order: @order,
                              coupon: @coupon, amount: @order_total,
                              status: 'success', updated_at: DateTime.now,
                              created_at: DateTime.now)
    if @redemption.save
      render json: @redemption
    else
      redemption.update(status: 'failed')
      redemption.save

      render json: { message: "Fail Redemption" }, status: 500
    end
  end

  private
    def redemption_params
      params.require(:redemption).permit(:customer, :order, :coupon)
    end

    def find_redemption
      @redemption_id = params[:id]

      @redemption = Redemption.find_by(id: @redemption_id)
    end

    def find_coupon
      @coupon_id = params[:coupon]

      @coupon = Coupon.find_by(id: @coupon_id)
    end

    def find_customer
      @customer_source_uid = params[:customer][:source_uid]

      @customer = Customer.find_by(source_uid: @customer_source_uid)
    end

    def find_order
      @order_id = params[:order][:id]

      @order = Order.find_by(id: @order_id)
    end
end
