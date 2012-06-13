class CreateStarGivers < ActiveRecord::Migration
  def change
    create_table :star_givers do |t|

      t.timestamps
    end
  end
end
