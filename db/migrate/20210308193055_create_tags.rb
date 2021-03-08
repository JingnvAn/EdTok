class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.integer :video_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
