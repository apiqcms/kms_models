module Kms
  class HasManyField < Field
    def get_value(entry)
      entry_ids = entry.values[liquor_name]
      association_records = Kms::Entry.where(id: entry_ids)
      Liquor::DropDelegation.wrap_scope(association_records)
    end
  end
end
