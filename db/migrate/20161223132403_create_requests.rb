class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.references :credit, index: true
      t.integer :status
      t.timestamps
    end
  end
end
