module CouponsHelper
  def campaign_name(coupon)
    coupon.campaign ? coupon.campaign.name : '------'
  end

  def customer_name(coupon)
    coupon.customers.length > 0 ? coupon.customers.map { |customer| customer.first_name + ' ' + customer.last_name } : '-----'
  end
end
