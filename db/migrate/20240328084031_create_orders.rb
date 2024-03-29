class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :merchant, null: false, foreign_key: true
      t.references :shopper, null: false, foreign_key: true
      t.float :amount
      t.datetime :created_at, null: false
      t.datetime :completed_at
    end
  end
end
