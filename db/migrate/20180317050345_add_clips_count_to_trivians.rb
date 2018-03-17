class AddClipsCountToTrivians < ActiveRecord::Migration[5.0]
  def change
    add_column :trivians, :clips_count, :integer
  end
end
