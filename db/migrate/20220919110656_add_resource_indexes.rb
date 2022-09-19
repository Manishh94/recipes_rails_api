class AddResourceIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :ratings, %I[resource_id resource_type]
    add_index :ratings, %I[resource_id resource_type user_id], unique: true
  end
end
