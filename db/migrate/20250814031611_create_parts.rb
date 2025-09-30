class CreateParts < ActiveRecord::Migration[7.1]
  def change
    create_table :parts do |t|
      t.string :title, null: false
      t.text   :description
      t.string :slug
      t.references :user, null: false, foreign_key: true
      t.integer :position  # for ordering parts if needed
      t.integer :visibility, default: 1
      t.timestamps
    end
  end
end
