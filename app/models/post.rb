class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  validates_presence_of :photo, :created_by
end
