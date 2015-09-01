class User < ActiveRecord::Base
  has_many :reservations
  #before_save :some_function
  before_validation :generate_token
  validates :email, presence: true, uniqueness: true, length: {minimum: 10, maximum: 100}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :access_token, presence: true, uniqueness: true
  has_secure_password

  protected
  def generate_token
    if access_token.blank?
      self.access_token = SecureRandom.hex
    end
  end
end
