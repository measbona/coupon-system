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

custom_charset = ["P", "O"]
length_per_code = 3

@arr = []

def random(chars, length, prefix = '')
  chars.each_with_index do |char, index|
    if length == 1 then 
      @arr.push(prefix + char) 
    else 
      random(chars, length - 1, prefix + char)
    end
  end
end

random(custom_charset, length_per_code)

puts(@arr)