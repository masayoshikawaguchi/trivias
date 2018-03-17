class RemoveClipscountFromTrivians < ActiveRecord::Migration[5.0]
  def change
    remove_reference :trivians, :clipscount, index: true
  end
  
end
