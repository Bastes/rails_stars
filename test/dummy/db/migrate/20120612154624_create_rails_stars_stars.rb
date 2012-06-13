class CreateRailsStarsStars < ActiveRecord::Migration
  def change
    create_table(:rails_stars_stars) do |t|
      t.integer :star_giver_id
      t.string :star_giver_type
      t.integer :star_receiver_id
      t.string :star_receiver_type
      t.integer :rating
    end

    add_index :rails_stars_stars, :star_giver_id
    add_index :rails_stars_stars, :star_giver_type
    add_index :rails_stars_stars, :star_receiver_id
    add_index :rails_stars_stars, :star_receiver_type
    add_index :rails_stars_stars, :rating
  end
end
