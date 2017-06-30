class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :email, email_format: {message: "Not a valid email address!"}
  validates :address, presence: true
  validates :message, presence: true
end
