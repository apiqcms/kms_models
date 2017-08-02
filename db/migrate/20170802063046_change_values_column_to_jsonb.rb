class ChangeValuesColumnToJsonb < ActiveRecord::Migration[5.1]
  def change
    change_column :kms_entries, :values, :jsonb, default: {}
  end
end
