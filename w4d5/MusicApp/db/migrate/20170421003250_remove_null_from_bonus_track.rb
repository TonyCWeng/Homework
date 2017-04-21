class RemoveNullFromBonusTrack < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tracks, :track_bonus, true
    change_column :tracks, :track_bonus, :boolean, :default => false
  end
end
