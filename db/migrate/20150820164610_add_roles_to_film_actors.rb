class AddRolesToFilmActors < ActiveRecord::Migration
  def change
    add_column :film_actors , :role ,:string
  end
end
