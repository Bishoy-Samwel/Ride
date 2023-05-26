class AddStyleRefToBikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :bikes, :style, null: false, foreign_key: true
  end
end
