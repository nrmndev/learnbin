class CreateTopicPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :topic_posts do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.integer :position  # optional order field
      t.integer :visibility, default: 1
      t.timestamps
    end

    add_index :topic_posts, [:topic_id, :post_id]
  end
end
