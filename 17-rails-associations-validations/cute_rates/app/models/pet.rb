class Pet < ApplicationRecord
  belongs_to :person
  validates :name, presence: true
  validates :name, uniqueness: { scope: :person_id,
    message: "can't have two pets with the same name" }
  validates :image, presence: true
end
