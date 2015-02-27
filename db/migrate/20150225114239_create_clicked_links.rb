class CreateClickedLinks < ActiveRecord::Migration
  def change
    create_table :clicked_links do |t|

      t.user_id, :integer
      t.link_id, :integer

      t.timestamps null: false
    end
  end
end
