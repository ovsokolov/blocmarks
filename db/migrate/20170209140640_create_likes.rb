class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :bookmark

      t.timestamps
    end
    add_index :likes, :user
    add_index :likes, :bookmark
  end
end
