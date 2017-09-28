class Business < ApplicationRecord
  belongs_to :category
  has_many :recommendations
end
