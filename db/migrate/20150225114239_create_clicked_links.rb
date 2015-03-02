class CreateClickedLinks < ActiveRecord::Migration
  def change
    create_table :clicked_links do |t|

      t.timestamps null: false
    end
  end
end
