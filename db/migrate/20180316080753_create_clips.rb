class CreateClips < ActiveRecord::Migration[5.0]
  def change
    create_table :clips do |t|
      t.references :user, foreign_key: true
      t.references :trivian, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :trivian_id], unique: true
    end
  end
end
