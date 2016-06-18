class CreateProductattributes < ActiveRecord::Migration
  def change
    create_table :productattributes do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
