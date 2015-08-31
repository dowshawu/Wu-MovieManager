class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :format, null: false
      t.integer :length, null: false
      t.integer :release_year
      t.integer :rating, null: true
      t.timestamps null: false

      t.index :user_id
    end
  end

  def down
  	drop_table :movies
  end
end
