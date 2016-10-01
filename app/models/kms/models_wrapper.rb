module Kms
  class ModelsWrapper
    include Liquor::Dropable

    def method_missing(name, *args, &block)
      model = Kms::Model.find_by(collection_name: name.to_s)
      model ? model.entries.order('position') : super
    end

    def respond_to_missing?(method_name, include_private = false)
      Kms::Model.where(collection_name: method_name.to_s).exists? || super
    end
  end
end
