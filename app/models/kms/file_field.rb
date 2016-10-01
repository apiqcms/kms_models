module Kms
    class FileField < Field
      def get_value(entry)
        value = entry.values[liquor_name]
        uploader = EntryFileUploader.new(OpenStruct.new(model: entry, field_name: liquor_name))
        uploader.retrieve_from_store! value
        uploader.url
      end
    end
end
