class Film < ActiveRecord::Base
  has_many :film_directors
  has_many :film_actors
  # has_many :directors, through: :film_directors, class: :cast######
  # has_many :actors, through: :film_actors, class: :cast######
end
