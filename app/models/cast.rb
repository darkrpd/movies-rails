class Cast < ActiveRecord::Base

  has_many :film_directors
  has_many :film_actors
  has_many :movies_acted, through: :film_directors, source: :film
  has_many :movies_directed, through: :film_actors, source: :film

end
