class AddIndexToRiviews < ActiveRecord::Migration
  def up
    add_index :reviews, :book_id
  end

  def down
    remove_index :reviews, :book_id
  end
end
