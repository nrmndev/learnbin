class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text   :description
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :visibility, default: 1
      t.timestamps
    end
    add_index :collections, :slug, unique: true
  end
end
