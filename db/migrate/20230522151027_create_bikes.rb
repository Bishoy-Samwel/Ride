class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.text :desc
      t.integer :style
      t.decimal :price

      t.timestamps
    end
  end
end
