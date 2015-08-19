class CreateFilmActors < ActiveRecord::Migration
  def change
    create_table :film_actors do |t|
      t.integer :film_id
      t.integer :cast_id
    end
  end
end
