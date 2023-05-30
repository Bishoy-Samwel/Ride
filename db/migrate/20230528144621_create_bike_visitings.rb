class CreateBikeVisitings < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_visitings do |t|
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
