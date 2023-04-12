class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.integer :theme_id
      t.integer :name
      t.timestamps
    end
  end
end
