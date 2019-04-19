class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :deadline
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
