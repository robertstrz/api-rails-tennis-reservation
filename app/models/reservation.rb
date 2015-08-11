class Reservation < ActiveRecord::Base
  belongs_to :court
  validates :court_id, :presence => true
  validates :user_id, :presence => true
end
