class AddVisibilityToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :visibility, :integer
  end
end
