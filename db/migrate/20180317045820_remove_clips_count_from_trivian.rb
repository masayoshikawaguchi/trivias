class RemoveClipsCountFromTrivian < ActiveRecord::Migration[5.0]
  def change
    remove_reference :trivians, :clips_count, index: true
  end
end
