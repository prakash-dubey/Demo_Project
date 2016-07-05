class CreateCouponsUseds < ActiveRecord::Migration
  def change
    create_table :coupons_useds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.date :created_date
      t.references :coupon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
