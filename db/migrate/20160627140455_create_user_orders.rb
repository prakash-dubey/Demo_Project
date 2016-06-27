class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.integer :payment_gateway_id
      t.decimal :shipping_charges, precision: 12, scale: 2
      t.string :status
      t.decimal :total_amount, precision: 12, scale: 2
      t.references :user, index: true, foreign_key: true
      t.references :coupon, index: true, foreign_key: true
      t.integer :shipping_method
      t.string :transaction_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.timestamps null: false
    end
  end
end
