## Version 1.0.0 2017-08-02

* [fixed] find_by and find_all_by now can find results not only by dynamic fields but also by id, slug, position and etc.
* [added] add slug attribute to entry drop
* [added]	support Amazon S3 storage - closes #14
* [added] add blank state screens for models and entries
* [added] automatic Model's collection_name and Fields liquor_name generating - closes #16
* [changed] replace JSON column with JSONB - closes #15
* [added] Sorting (by dran'n'drop) Model's fields - closes #4
* [fixed]	fetch item only in scope of model - page's templatable type

## Version 0.8.0 2017-03-23

* [fixed] fix incorrect url for file field when no value was stored
* [changed] preserve order of has_many field values - closes #9
* [added] Rspec setup
* [added] add feature allowing model elements creation using website forms

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
