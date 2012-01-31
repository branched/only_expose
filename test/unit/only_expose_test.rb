require File.expand_path("../../test_helper", __FILE__)

class TestOnlyExpose < Test::Unit::TestCase

  def test_adds_class_method_only_expose 
    assert_includes Foo.public_methods ,:only_expose
  end

  def test_adds_class_method_exposed_attributes
    assert_includes Foo.public_methods, :exposed_attributes
  end
  
  def test_returns_correct_attributes_using_to_json
    assert_equal '{"foo":{"address":"A Street","name":"James"}}', foo.to_json
  end

  def test_returns_correct_attributes_using_to_xml
    assert_equal "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<foo>\n  <name>James</name>\n  <address>A Street</address>\n</foo>\n" , foo.to_xml
  end

  def test_a_non_overriding_child_returns_its_parents_attributes
    bar = Bar.new(:name => 'James' , :address => 'A Street' , :age => '18')
    assert_equal '{"bar":{"address":"A Street","name":"James"}}', bar.to_json
  end

  def test_an_overriding_child_returns_those_attributes
    baz = Baz.new(:name => 'Gerald' , :address => 'A Street' , :age => '18')
    assert_equal '{"baz":{"name":"Gerald"}}', baz.to_json
  end

  def foo
    Foo.new(:name => 'James' , :address => 'A Street' , :age => '18')
  end
end
