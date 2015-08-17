class Court < ActiveRecord::Base
  has_many :reservations
  belongs_to :city

  validates :city_id, :presence => true
end
