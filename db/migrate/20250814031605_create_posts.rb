class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :position
      t.integer :visibility, default: 1
      t.timestamps
    end
    add_index :posts, :slug
  end
end
