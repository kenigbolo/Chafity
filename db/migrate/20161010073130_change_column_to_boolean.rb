class ChangeColumnToBoolean < ActiveRecord::Migration[5.0]
  def change
      execute <<-SQL
        ALTER TABLE messages ALTER COLUMN status DROP DEFAULT;
        ALTER TABLE messages ALTER COLUMN status TYPE bool USING status::boolean;
        ALTER TABLE messages ALTER COLUMN status SET DEFAULT FALSE;
      SQL
  end
end
