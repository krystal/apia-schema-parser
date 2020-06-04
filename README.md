# Rapid Schema Parser

This library provides a little Ruby wrapper on top of a Rapid Schema JSON file. It allows you to browse the specification for a Rapid API through Ruby.

## Installation

Just in the gem...

```ruby
source "https://rubygems.pkg.github.com/krystal" do
  gem 'rapid-schema-parser', '~> 1.0'
end
```

## Get started

```ruby
schema = RapidSchemaParser.load_from_file('path/to/schema.json')
schema.host                   # => hostname
schema.namespace              # => namespace for URLs
schema.api.controllers        # => all controllers
schema.api.authenticator      # => global authenticator
```
