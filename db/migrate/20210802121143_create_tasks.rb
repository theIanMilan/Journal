class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.datetime :deadline, default: -> { 'NOW()' }
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
