# 10.times.each do |i|
#   Customer.create(first_name: FFaker::Name.unique.name, last_name: FFaker::Name.unique.name)
# end

# rules_json = %|{
#   'condition': 'OR',
#   'rules': [
#     { 'id': 'order_volume.total_amount',
#       'field': 'Total Amount',
#       'type': 'integer',
#       'input': 'text',
#       'operator': '>',
#       'value': 10 },
#     { 'id': 'order_volume.total_amount',
#       'field': 'Total Amount',
#       'type': 'integer',
#       'input': 'text',
#       'operator': '==',
#       'value': 10 },
#   ]
# }|

# custom_charset = ["N", "B"]
# length_per_code = 3

# prefix = "MAC"
# suffix = ""

# @arr = []

# def coupon_generator(chars, length, code = '', prefix, suffix)
#   chars.each_with_index do |char, index|
#     if length == 1 then
#       coupon_code = prefix + code + char + suffix
#       coupon_type = ["percentage", "amount"].sample
#       value = [10, 15, 20, 5, 20].sample
#       valid_until = Date.new(2021, 9, 30)
#       published_at = Date.new()

#       Coupon.create(coupon_code: coupon_code, coupon_type: coupon_type, value: value, status: "active", valid_until: valid_until, published_at: published_at)
#     else 
#       coupon_generator(chars, length - 1, code + char, prefix, suffix)
#     end
#   end
# end

# coupon_generator(custom_charset, length_per_code, prefix, suffix)

# puts(@arr)

# customers = Customer.all

# for i in customers
#   i.update(source_uid: FFaker::SSNSE.ssn)
#   i.save
# end