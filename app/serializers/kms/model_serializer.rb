module Kms
  class ModelSerializer < ActiveModel::Serializer
    attributes :id, :kms_model_name, :collection_name, :label_field, :fields_attributes

    has_many :fields_attributes, serializer: Kms::FieldSerializer

    def fields_attributes
      object.fields
    end

  end
end
