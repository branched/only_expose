require 'spec_helper'

describe 'OnlyExpose :' do

  context 'a parent model' do
    let(:foo){Foo.new(:name => 'James' , :address => 'A Street' , :age => '18')}

    it 'adds class method only_expose' do
      Foo.public_methods.include? 'only_expose'
    end 

    it 'adds class methods exposed_attributes' do
      Foo.public_methods.include? 'expose_attributes'
    end

    it 'returns only attributes defined when using to_json' do
      foo.to_json.should eq '{"foo":{"address":"A Street","name":"James"}}'
    end

    it 'returns only attributes defined when using to_xml' do
      foo.to_xml.should 
      eq '<?xml version="1.0" encoding="UTF-8"?>
          <foo>
            <name>James</name>
            <address>A Street</address>
          </foo>'
    end
  end

  context 'a non overriding child model' do 
    let(:bar){ Bar.new(:name => 'James' , :address => 'A Street' , :age => '18')}

    it 'returns all its parents defined attributes' do
      bar.to_json.should eq '{"bar":{"address":"A Street","name":"James"}}'
    end
  end

  context 'an overriding child model' do
    let(:baz){ Baz.new(:name => 'Gerald' , :address => 'A Street' , :age => '18')}
    it 'returns only its specified attributes' do
      baz.to_json.should eq '{"baz":{"name":"Gerald"}}'
    end
  end


end
