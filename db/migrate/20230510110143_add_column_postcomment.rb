class AddColumnPostcomment < ActiveRecord::Migration[6.1]
  def change
   add_reference :post_comments, :goal, null: false, foreign_key: true
  end
end
