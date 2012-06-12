class CreateRailsStarsStars < ActiveRecord::Migration
  def change
    create_table(:rails_stars_stars) do |t|
<% %w{starrer starred}.each do |association| -%>
<%   {'id' => :integer, 'type' => :string}.each do |suffix, type| -%>
      t.<%= type %> :<%= association %>_<%= suffix %>
<%   end -%>
<% end -%>
      t.integer :rating
    end

<% %w{starrer starred}.each do |association| -%>
<%   {'id' => :integer, 'type' => :string}.each do |suffix, type| -%>
    add_index :rails_stars_stars, :<%= association %>_<%= suffix %>
<%   end -%>
<% end -%>
    add_index :rails_stars_stars, :rating
  end
end
