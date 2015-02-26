class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :brand
      t.string :title
      t.string :img_url
      t.string :url
      t.boolean :clicked, default: false

      t.timestamps 
    end
  end
end
