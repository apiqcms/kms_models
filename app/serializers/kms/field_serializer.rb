module Kms
  class FieldSerializer < ActiveModel::Serializer
    attributes :id, :name, :liquor_name, :type, :class_name
  end

end
