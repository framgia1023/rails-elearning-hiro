class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user
      t.references :action
      t.string :action_type

      t.timestamps
    end

    add_index :activities, [:action_id, :action_type]
  end
end
