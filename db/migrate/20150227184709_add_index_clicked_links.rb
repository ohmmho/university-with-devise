class AddIndexClickedLinks < ActiveRecord::Migration
  def change
    add_index :clicked_links, [:link_id, :user_id], unique: true
  end
end
