# Current working, when redemption the coupon, active record not save when validation is false

class Redemption < ApplicationRecord
  belongs_to :order
  belongs_to :coupon
  belongs_to :customer

  VALID_OPERATORS = ['<', '>', '<=', '>=', '==']

  validates :amount, :coupon, :customer, presence: :true

  validate :validate_coupon_rule

  def validate_coupon_rule
    if coupon.validation_rule.present?
      order_amount = order[:amount]

      rule_json = eval(coupon.validation_rule.rules)
      rule_condition = rule_json[:condition].downcase

      validable = []

      for i in rule_json[:rules]
        if VALID_OPERATORS.include? i[:operator]
          operator = i[:operator]
          rule_amount = i[:value]

          if order_amount.method(operator).(rule_amount)
            validable.push('match')

            validable.clear if validable.include?('error')
          else
            validable.push('error')

            break if rule_condition != 'or'
          
            validable.clear if validable.include?('match')
          end
        else
          errors.add(:coupon, message: "Invalid operator")
        end
      end

      errors.add(:order, message: "Redemption coupon fails") if validable.include?('error')
    end
  end

end
