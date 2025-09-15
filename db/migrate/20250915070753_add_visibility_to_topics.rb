class AddVisibilityToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :visibility, :integer
  end
end
