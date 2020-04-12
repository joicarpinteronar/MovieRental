class Client < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals
end
