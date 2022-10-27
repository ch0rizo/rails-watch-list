puts 'Clearing DB'
Movie.destroy_all

puts 'Creating some fake movies'
20.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::Lorem.sentence, poster_url: Faker::Avatar.image, rating: rand(0..10))
end

puts 'Finished!'
puts "Made #{Movie.count} movies"
