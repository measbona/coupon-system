class Metadatum < ApplicationRecord
  has_many :order
  has_many :metadata
end
