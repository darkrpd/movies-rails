class FilmDirector < ActiveRecord::Base
  belongs_to :cast
  belongs_to :film
end
