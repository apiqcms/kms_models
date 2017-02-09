class AddAllowCreationUsingFormToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :kms_models, :allow_creation_using_form, :boolean, default: false
  end
end
