class CouponGenerator
  def self.create(campaign)
    codes = []

    campaign.code_count.times do
      codes.push(random_string(campaign.charset, campaign.code_length, campaign.prefix, campaign.suffix))
    end

    coupons = codes.map do |code|
      coupon_type = ["percentage", "amount"].sample
      value = [10, 15, 20, 5, 20].sample
      valid_until = campaign.ended_at
      published_at = campaign.started_at
      coupon = {coupon_code: code, coupon_type: coupon_type, value: value, status: "active", valid_until: valid_until, published_at: published_at, campaign: campaign}

      coupon
    end

    Coupon.create(coupons)
  end

  private

    def self.random_string(chars, length, prefix = "", suffix = "")
      letters = chars
      codes = Array[]

      length.times do
          r = rand(0..chars.length-1)

          letter = letters[r]

          codes.push(prefix + letter + suffix)
      end

      result = codes.join("")
    end
end