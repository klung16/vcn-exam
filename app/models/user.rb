class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true
  validates :email, presence: true, email_format: {message: "Not a valid email address!"}
  validates :address, presence: true
  validates :message, presence: true
end
