class AddPositionToKmsEntries < ActiveRecord::Migration
  def change
    add_column :kms_entries, :position, :integer, default: 0, null: false
  end
end
