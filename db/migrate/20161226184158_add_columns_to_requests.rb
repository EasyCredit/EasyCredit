class AddColumnsToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :credit_name, :string
  end
end
