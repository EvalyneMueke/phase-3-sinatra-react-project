class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :item
      t.string :importance
      t.integer :category_id
      t.integer :user_id
    end
  end
end
