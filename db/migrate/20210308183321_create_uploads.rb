class CreateUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :uploads do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
  end
end
