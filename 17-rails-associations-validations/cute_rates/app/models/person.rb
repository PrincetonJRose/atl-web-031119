class Person < ApplicationRecord
  has_many :pets
  accepts_nested_attributes_for :pets
end
