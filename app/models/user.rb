class User < ActiveRecord::Base
  has_many :reservations
  #before_save :some_function
  before_validation :ensure_login_has_a_value, :some_function
  validates :email, presence: true, uniqueness: true, length: {minimum: 10, maximum: 100}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :access_token, presence: true, uniqueness: true
  has_secure_password

  protected
  def ensure_login_has_a_value
    if email.blank?
      self.email = "afafa"
      #self.access_token = SecureRandom.hex
    end
  end

  protected
  def some_function
    if access_token.blank?
      self.access_token = SecureRandom.hex
    end
  end

end
