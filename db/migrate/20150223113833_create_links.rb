class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :type
      t.string :title
      t.string :img_url
      t.string :url

      t.timestamps 
    end
  end
end
