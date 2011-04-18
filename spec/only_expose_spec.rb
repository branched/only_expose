require 'spec_helper'

describe 'OnlyExposer :' do

  context 'a parent model' do

    before :all do
      Foo.only_expose :name, :address
    end

    it 'adds class method only_expose' do
      Foo.public_methods.include? 'only_expose'
    end 

    it 'adds class methods exposed_attributes' do
      Foo.public_methods.include? 'expose_attributes'
    end

    it 'returns only attributes defined when using to_json' do
      Foo.first.to_json.should eq '{"foo":{"address":"A Street","name":"James"}}'
    end

    it 'returns only attributes defined when using to_xml' do
      Foo.first.to_xml.should 
      eq '<?xml version="1.0" encoding="UTF-8"?>
          <foo>
            <name>James</name>
            <address>A Street</address>
          </foo>'
    end
  end

  context 'a child model' do 

    before :all do
      Foo.only_expose :name, :address
    end

    it 'returns its parents specified attributes' do
      Bar.first.to_json.should eq '{"bar":{"address":"A Street","name":"James"}}'
    end
  end

  context 'an overriding child model' do

    before :all do
      Bar.only_expose :name
    end

    it 'returns only its specified attributes' do
      Bar.first.to_json.should eq '{"bar":{"name":"James"}}'
    end
  end


end
