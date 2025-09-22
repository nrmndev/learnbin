class CreateCollectionTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :collection_topics do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :position  # optional order field
      t.integer :visibility, default: 1
      t.timestamps
    end

    add_index :collection_topics, [:collection_id, :topic_id]
  end
end
