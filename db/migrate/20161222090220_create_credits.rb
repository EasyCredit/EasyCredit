class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :user, index: true
      t.string :name
      t.string :description
      t.integer :month_count
      t.integer :credit_rate
      t.datetime :payment_date
      t.timestamps
    end
  end
end
