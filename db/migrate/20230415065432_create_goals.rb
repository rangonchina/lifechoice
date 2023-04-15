class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.integer :goal_id
      t.integer :user_id
      t.integer :theme_id
      t.integer :status
      t.text :content
      t.integer :rate
      t.boolean :published
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
