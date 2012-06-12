class CreateRailsStarsStars < ActiveRecord::Migration
  def change
    create_table(:rails_stars_stars) do |t|
      t.integer :starrer_id
      t.string :starrer_type
      t.integer :starred_id
      t.string :starred_type
      t.integer :rating
    end

    add_index :rails_stars_stars, :starrer_id
    add_index :rails_stars_stars, :starrer_type
    add_index :rails_stars_stars, :starred_id
    add_index :rails_stars_stars, :starred_type
    add_index :rails_stars_stars, :rating
  end
end
