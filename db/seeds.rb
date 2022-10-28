require "json"
require "open-uri"

puts 'Clearing DB'
Bookmark.destroy_all
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

relevant_infos = data["results"]

relevant_infos.each do |info|
  Movie.create(title: info["original_title"], overview: info["overview"], poster_url: info["poster_path"], rating: info["popularity"])
end

# Images https://image.tmdb.org/t/p/original/******

puts 'Finished!'
puts "Made #{Movie.count} movies"
