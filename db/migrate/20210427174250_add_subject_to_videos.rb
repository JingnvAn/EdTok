class AddSubjectToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :subject, :string
  end
end
