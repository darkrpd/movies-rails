class CreateFilmDirector < ActiveRecord::Migration
  def change
    create_table :film_directors do |t|
      t.integer :film_id
      t.integer :person_id
    end
  end
end
