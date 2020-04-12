class Movie < ApplicationRecord
  has_many :rentals
  has_many :clients, through: :rentals


  has_attached_file :image, styles: { medium: "400x600#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
