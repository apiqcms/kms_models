class AddDescriptionToKmsModels < ActiveRecord::Migration[5.1]
  def change
    add_column :kms_models, :description, :text
  end
end
