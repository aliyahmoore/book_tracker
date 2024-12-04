class CreateBookClubs < ActiveRecord::Migration[7.2]
  def change
    create_table :book_clubs do |t|
      t.string :name
      t.text :description
      t.integer :book_id

      t.timestamps
    end
    add_index :book_clubs, :book_id
  end
end
