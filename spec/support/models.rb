class Foo < ActiveRecord::Base 
  include OnlyExpose

  def self.columns() @columns ||= []; end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  
  column :name, :string
  column :address, :string
  column :age, :integer

  only_expose :name, :address
end

class Bar < Foo
end

class Baz < Foo
  only_expose :name
end

Factory.define :foo do |f|
  f.name 'James'
  f.age 18
  f.address 'A Street'
end

Factory.define :bar do |f|
  f.name 'Timmy'
  f.age 18
  f.address 'A Different Street'
end

Factory.define :baz do |f|
  f.name 'Gerald'
  f.age 18
  f.address 'Another City'
end
