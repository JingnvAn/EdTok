class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :video_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
