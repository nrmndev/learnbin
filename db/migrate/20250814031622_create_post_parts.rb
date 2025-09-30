class CreatePostParts < ActiveRecord::Migration[7.1]
  def change
    create_table :post_parts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :position  # optional order field
      t.integer :visibility, default: 1
      t.timestamps
    end

    add_index :post_parts, [:post_id, :part_id]
  end
end
