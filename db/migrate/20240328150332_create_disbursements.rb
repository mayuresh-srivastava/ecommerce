class CreateDisbursements < ActiveRecord::Migration[7.1]
  def change
    create_table :disbursements do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :fee, precision: 10, scale: 2
      t.references :item, polymorphic: true, null: false

      t.timestamps
    end
  end
end
