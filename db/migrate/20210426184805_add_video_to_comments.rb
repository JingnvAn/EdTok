class AddVideoToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :video_id, :integer
  end
end
