class Trip < ApplicationRecord
  validates_presence_of :trip_name
  has_many :locations
end
