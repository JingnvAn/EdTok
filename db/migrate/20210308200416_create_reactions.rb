class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.integer :video_id
      t.integer :comment_id
      t.integer :like_id

      t.timestamps
    end
  end
end
