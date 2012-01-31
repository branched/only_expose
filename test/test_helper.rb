require File.expand_path("../../lib/only_expose", __FILE__)
require 'active_record'
require 'test/unit'

class Foo < ActiveRecord::Base 
  include OnlyExpose
  only_expose :name, :address
end

class Bar < Foo
end

class Baz < Foo
  only_expose :name
end

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

class SetupTables < ActiveRecord::Migration 
  def change
    create_table :foos do |t|
      t.string :name
      t.string :address
      t.integer :age
    end
  end
end
SetupTables.new.migrate :up 
