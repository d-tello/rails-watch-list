# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# remove max file size limit for OpenURI
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

def create_seeds(page_number)
  data = JSON.parse(open("http://tmdb.lewagon.com/movie/top_rated?page=#{page_number}").read)

  data['results'].each do |movie|
    title = movie['title']
    overview = movie['overview']
    rating = movie['vote_average'].to_i
    poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
    Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
    puts "#{title} has been added to the database 🎬"
  end
end

def clear_database
  puts "\n=> Clearing existing seeds 🗑"
  Bookmark.destroy_all
  Movie.destroy_all
end

clear_database

def seeds_multi_page
  page = 1
  end_page = 430
  while page <= end_page
    create_seeds(page)
    page += 1
  end
end

seeds_multi_page
