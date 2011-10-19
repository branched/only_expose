class Foo < ActiveRecord::Base 
  include OnlyExpose

  only_expose :name, :address
end

class Bar < Foo
end

class Baz < Foo
  only_expose :name
end
