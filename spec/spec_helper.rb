require 'only_expose'
require 'active_record'

load File.dirname(__FILE__) + '/support/models.rb'

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
