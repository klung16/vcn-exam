class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :email, email_format: {message: "Not a valid email address!"}
end
