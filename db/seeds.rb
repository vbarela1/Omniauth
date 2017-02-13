require 'faker'
4.times do 
  Trip.create(
    trip_name: Faker::Address.country, 
    trip_id: trip.id 
  )

end

puts "There are now #{Trip.count} trips."

Trip.all.each do |trip|
  3.times do 
    Location.create(
      name: Faker::GameOfThrones.city,
      description: Faker::Hipster.sentence,
      trip_id: trip.id,
    
    )
  end 
end 

puts "there are now #{Location.count} locations."

Location.all.each do |location|
  1.times do 
    Address.create(
      physical_address: Faker::Address.street_address,
      country: Faker::Address.country,
      city: Faker::Address.city,
      description: Faker::HarryPotter.quote,
      location_id: location.id,
      
    )
  end 
end 

puts "there are now #{Address.count} addresses"