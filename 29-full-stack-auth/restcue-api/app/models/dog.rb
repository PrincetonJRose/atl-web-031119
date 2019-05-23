class Dog < ApplicationRecord
  validates :name, :image_url, presence: true
end
