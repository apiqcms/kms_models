class CreateKmsEntries < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_entries do |t|
      t.belongs_to :model, index: true
      t.json :values

      t.timestamps
    end
  end
end
