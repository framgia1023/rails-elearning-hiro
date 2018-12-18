class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user
      t.references :category
      t.integer :results

      t.timestamps
    end
  end
end
