class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :duration

      t.timestamps
    end
  end
end
