class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.integer :album_id, null: false
      t.text :lyrics, null: false
      t.boolean :track_bonus, null: false
      t.timestamps
    end
    add_index :tracks, :album_id

  end
end
