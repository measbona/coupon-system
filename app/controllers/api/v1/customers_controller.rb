class Api::V1::CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @limit = params[:limit] ? params[:limit] : 10

    @customers = Customer.limit(@limit)

    render json: @customers
  end

  def show
    @customer = find_customer

    if @customer.present?
      render json: @customer
    else
      render json: { message: "Customer not found" }, status: 404
    end
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer
    else
      render json: { message: "Fail while creating customer" }, status: 500
    end
  end

  def update
    @customer = find_customer
    @customer.update(customer_params)

    if @customer.save(:validate => false)
      render json: @customer
    else
      render json: { message: "Fail while updating customer" }, status: 500
    end
  end

  def destroy
    @customer = find_customer

    if @customer.present?
      @customer.destroy

      render json: { message: "#{@customer.first_name} #{@customer.lat_name} has destroy" }, status: 404
    else
      render json: { message: "Customer not found" }, status: 404
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:source_id, :first_name, :last_name)
    end

    def find_customer
      @customer_id = params[:id]

      @customer = Customer.find_by(id: @customer_id)
    end
end
