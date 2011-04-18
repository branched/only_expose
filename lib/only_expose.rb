module OnlyExpose

  def self.included(base)
    base.extend ClassMethods
  end

  #Instance Methods
  
  def to_json(options = {})
    super(options.merge(:only => self.class.exposed_attributes))
  end

  def to_xml(options = {})
    super(options.merge(:only => self.class.exposed_attributes))
  end

  module ClassMethods
    
    def only_expose(*args)
      @@exposed_attributes = *args.map
    end

    def exposed_attributes
      @@exposed_attributes
    end
  end  
end
