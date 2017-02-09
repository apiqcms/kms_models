class AddSlugToKmsEntries < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_entries, :slug, :string
    add_index :kms_entries, :slug, unique: true
  end
end
