class RemoveColumnsLinks < ActiveRecord::Migration
  def change

    remove_column :links, :clicked
    
  end
end
