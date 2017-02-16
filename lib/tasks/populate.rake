namespace :populate do
  desc "Generate Trips"
  task trip: :environment do
    user = User.first
    if user
      40.times do
        user.trips.create(trip_name: Faker::Address.country, 
                            )
    end
      Trip.all.each do |trip|
        3.times do 
          Location.create(
            name: Faker::GameOfThrones.city,
            description: Faker::Hipster.sentence,
            trip_id: trip.id,
            )
         end 
      end 
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
    else
      raise 'No First User In The Database!'
    end
  end 
  end
