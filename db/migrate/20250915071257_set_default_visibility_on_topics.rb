class SetDefaultVisibilityOnTopics < ActiveRecord::Migration[7.1]
  def up
    # 1. Change default for new records
    change_column_default :topics, :visibility, from: nil, to: 1

    # If you want `NOT NULL` constraint as well (optional), do that after backfill
    # change_column_null :topics, :visibility, false

    # 2. Backfill existing records (that have nil visibility) to private (1)
    Topic.reset_column_information
    Topic.where(visibility: nil).update_all(visibility: 1)
  end

  def down
    # Revert default
    change_column_default :topics, :visibility, from: 1, to: nil

    # If you made visibility not null, revert it
    # change_column_null :topics, :visibility, true

    # You probably don’t want to undo the data mass update
    # so we generally don’t change existing records back
  end
end
