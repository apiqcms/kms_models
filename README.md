## KMS Models

[![Build Status](https://travis-ci.org/apiqcms/kms_models.svg?branch=master)](https://travis-ci.org/apiqcms/kms_models)
[![Code Climate](https://codeclimate.com/github/apiqcms/kms_models/badges/gpa.svg)](https://codeclimate.com/github/apiqcms/kms_models)

This extension adds "Models" section in [KMS](https://github.com/apiqcms/kms) and allows to define custom models on-the-fly. Supported fields for definition in Model: String, Text, Checkbox, File, HasMany, BelongsTo. Note that this extension requires at least PostgreSQL 9.2 because of JSON column type.

## Installation

1. Add to Gemfile

        gem "kms_models"
        # or for edge version:
        gem "kms_models", github: "webgradus/kms_models"

2. Run generator:

        rails g kms_models:install

3. Copy migrations:

        rails kms_models:install:migrations

4. Migrate:

        bundle exec rails db:migrate

5. Recompile assets:

        bundle exec rails assets:precompile

6. Restart KMS instance

## Getting started
Please watch this video to start using KMS Models:

[![Getting started with KMS Models extension](http://img.youtube.com/vi/WPZoWyd-thE/0.jpg)](https://youtu.be/_INzPDZimsA "Getting started with KMS Models extension")

## Contributing

Please follow [CONTRIBUTING.md](CONTRIBUTING.md).
