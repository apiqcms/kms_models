module Kms
  class Field < ActiveRecord::Base
    belongs_to :model
    scope :file_fields, -> { where(type: Kms::FileField.name) }
    scope :checkbox_fields, -> { where(type: Kms::CheckboxField.name) }
    scope :date_fields, -> { where(type: Kms::DateField.name) }

    def get_value(entry)
      # OVERRIDE in subclasses if needed
      entry.values[liquor_name]
    end
  end
end
