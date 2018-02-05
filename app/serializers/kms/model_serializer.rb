module Kms
  class ModelSerializer < ActiveModel::Serializer
    attributes :id, :kms_model_name, :collection_name, :description, :label_field, :allow_creation_using_form, :fields_attributes

    has_many :fields_attributes, serializer: Kms::FieldSerializer

    def fields_attributes
      object.fields.order(:position)
    end

  end
end
