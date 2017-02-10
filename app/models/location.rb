class Location < ApplicationRecord
  validates_presence_of :description
  has_many :addresses 
end
