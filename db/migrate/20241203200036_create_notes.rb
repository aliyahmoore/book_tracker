class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :book_club_id
      t.text :content

      t.timestamps
    end
    add_index :notes, :book_id
    add_index :notes, :user_id
    add_index :notes, :book_club_id
  end
end
