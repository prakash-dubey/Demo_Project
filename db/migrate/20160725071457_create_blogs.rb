class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :description
      t.string :name
      t.timestamps null: false
    end
  end
end
