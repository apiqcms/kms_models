class AddLabelFieldToKmsModels < ActiveRecord::Migration
  def change
    add_column :kms_models, :label_field, :string
  end
end
