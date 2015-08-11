class Court < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :reservations

  # validates :user, :presence => true
  # validates :city, :presence => true

end
