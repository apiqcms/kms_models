module Kms
  class BelongsToField < Field
    def get_value(entry)
      entry_id = entry.values[liquor_name]
      association_record = Kms::Entry.find_by(id: entry_id)
      Liquor::DropDelegation.wrap_element(association_record)
    end
  end
end
