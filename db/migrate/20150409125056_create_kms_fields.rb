class CreateKmsFields < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_fields do |t|
      t.string :name
      t.string :liquor_name
      t.string :type
      t.boolean :required
      t.belongs_to :model

      t.timestamps null: false
    end
  end
end
