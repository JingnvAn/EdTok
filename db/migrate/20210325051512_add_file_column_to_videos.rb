class AddFileColumnToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :file, :string
  end
end
