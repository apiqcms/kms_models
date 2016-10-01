class AddSlugToKmsEntries < ActiveRecord::Migration
  def change
    add_column :kms_entries, :slug, :string
    add_index :kms_entries, :slug, unique: true
  end
end
