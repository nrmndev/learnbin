class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :topics, :slug
  end
end
