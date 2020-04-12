class Rental < ApplicationRecord

  belongs_to :movie

  has_many :rentals
  has_many :clients, through: :rentals
end
