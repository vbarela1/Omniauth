class Address < ApplicationRecord
  validates_presence_of :description, :physical_address, :country, :city

end
