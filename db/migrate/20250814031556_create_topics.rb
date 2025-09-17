class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :slug
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :position
      t.integer :visibility, default: 1
      t.timestamps
    end
    add_index :topics, :slug
  end
end
