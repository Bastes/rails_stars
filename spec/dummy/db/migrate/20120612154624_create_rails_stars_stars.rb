class CreateRailsStarsStars < ActiveRecord::Migration
  def change
    create_table(:rails_stars_stars) do |t|
      t.string  :star_giver_type
      t.integer :star_giver_id
      t.integer :anchor_id
      t.integer :rating
    end

    create_table(:rails_stars_anchors) do |t|
      t.string  :star_receiver_type
      t.integer :star_receiver_id
      t.float   :rating_average
      t.integer :rating_count
    end

    add_index :rails_stars_stars, :star_giver_type
    add_index :rails_stars_stars, :star_giver_id
    add_index :rails_stars_stars, :anchor_id

    add_index :rails_stars_anchors, :star_receiver_type
    add_index :rails_stars_anchors, :star_receiver_id
  end
end
