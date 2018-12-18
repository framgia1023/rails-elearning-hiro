class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :lesson
      t.references :word
      t.references :choice

      t.timestamps
    end
  end
end
