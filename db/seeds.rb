# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Movie.create(title: "Winter Sleep", overview: "A hotel owner and landlord in a remote Turkish village deals with conflicts within his family and a tenant behind on his rent.", poster_url: "https://m.media-amazon.com/images/M/MV5BNTU1NTY2Mzg5M15BMl5BanBnXkFtZTgwNDcwNjM5MTE@._V1_.jpg", rating: 8.0)
# Movie.create(title: "Mortal World", overview: "Mermer Family lives a double life working at their family owned restaurant while being undercover assassins for an international organization. After their secret is revealed, this dysfunctional family needs to work together to survive.", poster_url: "https://m.media-amazon.com/images/M/MV5BZGQzMWY0NGYtMGE4MS00YmExLTkyOWItNzQxOWUzODkxNzAyXkEyXkFqcGdeQXVyNDQ2MTMzODA@._V1_.jpg", rating: 7.6)
# Movie.create(title: "The Bandit", overview: "Baran the Bandit, released from prison after 35 years, searches for vengeance and his lover.", poster_url: "https://m.media-amazon.com/images/M/MV5BOGQ4ZjFmYjktOGNkNS00OWYyLWIyZjgtMGJjM2U1ZTA0ZTlhXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg", rating: 8.1)
# Movie.create(title: "Loser's Club", overview: "Kaan and Mete, co-hosts of a mid 1990s radio show called Kaybedenler Kulübü (Losers' Club), struggle to deal with their daily lives after their show becomes an instant hit.", poster_url: "https://tr.web.img4.acsta.net/medias/nmedia/18/83/34/99/19684316.jpg", rating: 7.5)
# Movie.create(title: "The Yellow Mercedes", overview: "The film is based on 'Fikrimin Ince Gulu', a novel by Adalet Agaoglu, which depicts a first generation guest-worker returning home.", poster_url: "https://m.media-amazon.com/images/M/MV5BMTgyOTY3MzItNDdmZC00ODg3LTk1ZTAtNzQ4MDhiODcxNjExXkEyXkFqcGdeQXVyOTQ2MjQ3MTI@._V1_.jpg", rating: 7.8)

# db/seeds.rb
require 'faker'

# Clear existing data
Bookmark.destroy_all
Movie.destroy_all

# Seed with fake movie data
200.times do
  movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraph,
    poster_url: Faker::Internet.url,
    rating: Faker::Number.decimal(l_digits: 1, r_digits: 1)
  )

  # Create a bookmark for each movie
  List.all.each do |list|
    Bookmark.create(
      movie: movie,
      list: list,
      comment: Faker::Lorem.words(number: 6).join(' ')
    )
  end
end
