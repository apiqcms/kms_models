## Version 0.7.0 2016-12-05

* [fixed] fix bug when running kms_models install generator
* [changed] Rails 5 support

## Version 0.6.0 2016-10-01

* [changed] allow to edit Entry slug, but autogenerate on creation
* [added] English translations

## Version 0.5.0 2016-02-09

* [fixed] fix saving unchecked checkbox
* [fixed] element updating not working when some field are empty
* [changed] allow to pass File object when storing values for File Fields
* [changed] allow more file types for file fields - doc, xls, pdf, mp4, webm (previously only images allowed)
* [changed] alert about errors using Alertify
* [added] add ability to order model entries - using `order` method
* [added] register model in ModelDrop after creation - no need in app restart
* [added] Collection name method added - `item.model_collection_name`
* [added] expose entry id field in liquor
* [added] add confirmation before Model deleting
* [added] added BelongsTo field for Models (similar to Rails belongs_to)
* [added] support searching/filtering model entries with 'find_all_by', 'find_by'
