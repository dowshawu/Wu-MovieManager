class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.integer :userID, null: false
      t.string :title
      t.string :format
      t.time :length
      t.integer :release_year
      t.integer :rating, null: true
      t.timestamps null: false

      t.index :userID
    end
  end

  def down
  	drop_table :movies
  end
end
