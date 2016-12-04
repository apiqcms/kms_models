module Kms
  class ModelsWrapperDrop < Liquor::Drop
    def self.register_model(collection_name)
      has_many collection_name.to_sym
    end
  end
end
