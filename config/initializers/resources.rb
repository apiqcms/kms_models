Kms::ResourceService.register(:models, Kms::Model, "fa-tasks")
if Kms::Model.table_exists?
  Kms::Model.all.each do |model|
    Kms::ResourceService.register(:models, model, "fa-tasks")
  end
end
