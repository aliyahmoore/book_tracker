class AddUserIdToBookClubs < ActiveRecord::Migration[7.2]
  def change
    add_column :book_clubs, :user_id, :integer
    add_index :book_clubs, :user_id
  end
end
