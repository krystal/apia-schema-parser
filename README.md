![Screenshot](https://share.adam.ac/21/Artboard-Copy-CdqXC7jrsr6Lk61YdB.png)

[![Gem Version](https://badge.fury.io/rb/apia-schema-parser.svg)](https://badge.fury.io/rb/apia-schema-parser)

This library provides a little Ruby wrapper on top of a Apia Schema JSON file. It allows you to browse the specification for a Apia API through Ruby.

## Installation

Just in the gem...

```ruby
gem 'apia-schema-parser', '~> 1.0'
```

## Get started

```ruby
schema = ApiaSchemaParser.load_from_file('path/to/schema.json')
schema.host                   # => hostname
schema.namespace              # => namespace for URLs
schema.api.controllers        # => all controllers
schema.api.authenticator      # => global authenticator
```
