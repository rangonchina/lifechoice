class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :goals_id
      t.integer :themes_id

      t.timestamps
    end
  end
end
