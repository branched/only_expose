require 'spec_helper'

describe 'OnlyExposer :' do

  context 'a parent model' do

    before :all do
      @foo = Factory.stub :foo
    end

    it 'adds class method only_expose' do
      Foo.public_methods.include? 'only_expose'
    end 

    it 'adds class methods exposed_attributes' do
      Foo.public_methods.include? 'expose_attributes'
    end

    it 'returns only attributes defined when using to_json' do
      @foo.to_json.should eq '{"foo":{"address":"A Street","name":"James"}}'
    end

    it 'returns only attributes defined when using to_xml' do
      @foo.to_xml.should 
      eq '<?xml version="1.0" encoding="UTF-8"?>
          <foo>
            <name>James</name>
            <address>A Street</address>
          </foo>'
    end
  end

  context 'a child model' do 

    before :all do
      @bar = Factory.stub :bar
    end

    it 'returns all its attributes' do
      @bar.to_json.should eq '{"bar":{"address":"A Different Street","age":18,"id":1002,"name":"Timmy"}}'
    end
  end

  context 'an overriding child model' do

    before :all do
      @baz = Factory.stub :baz
    end

    it 'returns only its specified attributes' do
      @baz.to_json.should eq '{"baz":{"name":"Gerald"}}'
    end
  end


end
