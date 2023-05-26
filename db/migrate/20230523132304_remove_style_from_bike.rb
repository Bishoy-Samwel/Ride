class RemoveStyleFromBike < ActiveRecord::Migration[7.0]
  def change
    remove_column :bikes, :style, :string
  end
end
