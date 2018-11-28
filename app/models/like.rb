class Like < ApplicationRecord
  belongs_to :post
  validates_presence_of :liked_by
end
