module Kms
  class ModelsWrapperDrop < Liquor::Drop
    def self.register_model(collection_name)
      has_many collection_name.to_sym
    end

    Kms::Model.pluck(:collection_name).each do |collection_name|
      register_model collection_name
    end

  end
end
