class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.decimal :duration, null: false
      t.references :user, null: false
      t.date :performed_on, null: false

      t.timestamps
    end
  end
end
