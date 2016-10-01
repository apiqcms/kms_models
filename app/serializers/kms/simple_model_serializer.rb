module Kms
  class SimpleModelSerializer < ActiveModel::Serializer
    attributes :id, :label_field
  end
end
