module Kms
  class EntrySerializer < ActiveModel::Serializer
    attributes :id, :values, :position, :slug

    has_one :model, serializer: Kms::SimpleModelSerializer

    # OPTIMIZE
    def values
      values_with_urls = object.values.dup
      # prepare file fields
      object.model.fields.file_fields.each do |file_field|
        uploader = EntryFileUploader.new(OpenStruct.new(model: object, field_name: file_field.liquor_name))
        uploader.retrieve_from_store! values_with_urls[file_field.liquor_name]
        values_with_urls[file_field.liquor_name] = { url: uploader.file.exists? ? uploader.url : nil }
      end
      # prepare checkbox fields - cause PostgreSQL json stored as strings
      object.model.fields.checkbox_fields.each do |checkbox_field|
        values_with_urls[checkbox_field.liquor_name] = values_with_urls[checkbox_field.liquor_name] == 'true'
      end
      # prepare checkbox fields - cause PostgreSQL json stored as strings
      object.model.fields.date_fields.each do |date_field|
        values_with_urls[date_field.liquor_name] = Date.parse(values_with_urls[date_field.liquor_name])
      end
      values_with_urls
    end
  end
end
