ActiveRecord::Schema.define do
  self.verbose = false

  create_table :foos, :force => true do |t|
    t.string :name
    t.integer :age
    t.string :address
  end

end
