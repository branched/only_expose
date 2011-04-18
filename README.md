# README

only_expose allows you to specify which attributes of an ActiveRecord
method should be exposed when using to_json or to_xml. It makes exposing
model data easier to manage.

# Usage
    class Foo < ActiveRecord::Base
      include OnlyExpose
      only_expose :name
    end

This defines a class Foo which will only expose the attribute 'name'
when to_json or to_xml is used.

