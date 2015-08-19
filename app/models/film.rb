class Film < ActiveRecord::Base
  has_many :film_directors
  has_many :film_actors
  has_many :directors, through: :film_directors, source: :cast
  has_many :actors, through: :film_actors, source: :cast
end
