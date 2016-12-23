class FixCreditsFieldMonthCount < ActiveRecord::Migration[5.0]
  def change
    rename_column :credits, :month_counе, :month_count
  end
end
