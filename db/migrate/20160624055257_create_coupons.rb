class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :created_by_id
      t.decimal :discount_of, precision: 5, scale: 2
      t.integer :no_of_uses
      t.boolean :status

      t.timestamps null: false
    end
  end
end
