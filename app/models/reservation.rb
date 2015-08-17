class Reservation < ActiveRecord::Base
  belongs_to :court
  belongs_to :user

  validates :court_id, :presence => true
  validates :user_id, :presence => true

end
