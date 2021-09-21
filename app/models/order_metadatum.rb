class OrderMetadatum < ApplicationRecord
  belongs_to :order
  belongs_to :metadata
end
