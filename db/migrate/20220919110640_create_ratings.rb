class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      # Would like to change this to polymorphic as well so that we can add rating by other objects as well. (In future if we needed)
      t.integer :user_id
      t.integer :resource_id
      t.string :resource_type
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
