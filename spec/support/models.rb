class Foo < ActiveRecord::Base
  include OnlyExpose
end

class Bar < Foo
end


