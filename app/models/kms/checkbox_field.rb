module Kms
  class CheckboxField < Field
    def get_value(entry)
      entry.values[liquor_name] == 'true'
    end
  end
end
