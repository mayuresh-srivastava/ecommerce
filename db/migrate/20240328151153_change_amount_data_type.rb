class ChangeAmountDataType < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :amount, :decimal, precision: 10, scale: 2
  end
end
