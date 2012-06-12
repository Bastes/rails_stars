class CreateStars < ActiveRecord::Migration
  def change
    create_table(:rails_stars_stars) do |t|
<% %w{starrer starred}.each do |association| -%>
<%   {'id' => :integer, 'type' => :string}.each do |suffix, type| -%>
      t.<%= type %> :<%= association %>_<%= suffix %>
<%   end -%>
<% end -%>
      t.integer, :rating
    end

<% %w{starrer starred}.each do |association| -%>
<%   {'id' => :integer, 'type' => :string}.each do |suffix, type| -%>
    add_index :stars, :<%= association %>_<%= suffix %>
<%   end -%>
<% end -%>
    add_index :stars, :rating
  end
end
