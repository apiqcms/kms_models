Kms::Page.class_eval do
  # fetch item by slug
  def fetch_item(slug)
    return nil unless templatable?
    templatable_type.constantize.find_by_slug!(slug)
  rescue NameError
    model = Kms::Model.find(templatable_type.to_i)
    model.entries.find_by_slug(slug)
    # Kms::Entry.find_by_slug(slug)
  end

  # fetch items for templatable page
  def fetch_items
    templatable_type.constantize.all
  rescue NameError
    # in templatable_type we store id of Kms::Model object in this case
    model = Kms::Model.find(templatable_type.to_i)
    model.entries
  end
end
