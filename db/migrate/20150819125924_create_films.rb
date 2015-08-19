class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.string :details

      t.timestamps null: false
    end
  end
end
