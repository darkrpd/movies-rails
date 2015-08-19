class CreateFilmActor < ActiveRecord::Migration
  def change
    create_table :film_actors do |t|
      t.integer :film_id
      t.integer :person_id
    end
  end
end
