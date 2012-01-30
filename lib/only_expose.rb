require 'active_support/concern' 
module OnlyExpose
  extend ActiveSupport::Concern

  included do  
    def to_json(options = {})
      super(options.merge(:only => self.class.exposed_attributes))
    end

    def to_xml(options = {})
      super(options.merge(:only => self.class.exposed_attributes))
    end
  end

  module ClassMethods
    def only_expose(*args)
      @exposed_attributes = *args
    end
    def exposed_attributes
      if @exposed_attributes.nil? && self.superclass != ActiveRecord::Base
         superclass.exposed_attributes
      else
        @exposed_attributes
      end
    end
  end  
end
