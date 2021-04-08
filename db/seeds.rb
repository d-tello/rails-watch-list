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

genres = [
  { name: 'Action', id: 28 },
  { name: 'Adventure', id: 12 },
  { name: 'Animation', id: 16 },
  { name: 'Comedy', id: 35 },
  { name: 'Crime', id: 80 },
  { name: 'Documentary', id: 99 },
  { name: 'Drama', id: 18 },
  { name: 'Family', id: 10_751 },
  { name: 'Fantasy', id: 14 },
  { name: 'History', id: 36 },
  { name: 'Music', id: 10_402 },
  { name: 'Mystery', id: 9648 },
  { name: 'Romance', id: 10_749 },
  { name: 'Science Fiction', id: 878 },
  { name: 'TV Movie', id: 10_770 },
  { name: 'Thriller', id: 53 },
  { name: 'War', id: 10_752 },
  { name: 'Western', id: 37 }
]

def set_genre(different_genres, movie_genre)
  different_genres.each do |genre|
    return genre[:name] if genre[:id] == movie_genre
  end
end

def create_seeds(page_number, all_the_genres)
  data = JSON.parse(open("http://tmdb.lewagon.com/movie/top_rated?page=#{page_number}").read)
  data['results'].each do |movie|
    title = movie['title']
    overview = movie['overview']
    rating = movie['vote_average'].to_i
    poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

    Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url,
                 genre: set_genre(all_the_genres, movie['genre_ids'].first))
    puts "#{title} has been added to the database 🎬"
  end
end

def clear_database
  puts "\n=> Clearing existing seeds 🗑"
  Bookmark.destroy_all
  Movie.destroy_all
  List.destroy_all
end

def seeds_movies_part_one(movies_genres)
  page = 1
  end_page = 200
  while page <= end_page
    create_seeds(page, movies_genres)
    page += 1
  end
end

def seeds_movies_part_two(movies_genres)
  page = 201
  end_page = 430
  while page <= end_page
    create_seeds(page, movies_genres)
    page += 1
  end
end

def seeds_lists(genres_to_generate)
  puts "\n=> Creating lists... 📝"
  genres_to_generate.each do |genre|
    List.create(name: genre[:name])
    puts "Genre '#{genre[:name]}' added to the database"
  end
end

def seeds_bookmarks
  lists = List.all
  movies = Movie.all
  lists.each do |list|
    movies.each do |movie|
      if list.name == movie.genre
        Bookmark.create(comment: 'Amazing movie!', list_id: list.id, movie_id: movie.id)
        puts "#{movie.title} added to #{list.name}'s list ✅"
      end
    end
  end
end

def reset_database
  clear_database
  seeds_lists(genres)
  seeds_movies_part_one(genres)
  sleep(1.minute)
  seeds_movies_part_two(genres)
  seeds_bookmarks
end

reset_database
