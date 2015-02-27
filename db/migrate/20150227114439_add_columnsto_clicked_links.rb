class AddColumnstoClickedLinks < ActiveRecord::Migration
  def change
    add_column :clicked_links, :user_id, :integer
    add_column :clicked_links, :link_id, :integer

  end
end
