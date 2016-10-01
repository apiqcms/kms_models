class FixModelsColumnName < ActiveRecord::Migration
  def change
    rename_column :kms_models, :model_name, :kms_model_name
  end
end
