class CreateClickedLinks < ActiveRecord::Migration
  def change
    create_table :clicked_links do |t|
      t.integer :user_id
      t.integer :link_id

      t.timestamps null: false
    end
  end
end
