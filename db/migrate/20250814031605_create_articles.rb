class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :title
      t.string :slug
      t.text :summary

      t.timestamps
    end
    add_index :articles, :slug
  end
end
