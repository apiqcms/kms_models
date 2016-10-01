class AddClassNameToKmsFields < ActiveRecord::Migration
  def change
    add_column :kms_fields, :class_name, :string
  end
end
