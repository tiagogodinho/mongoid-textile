require 'spec_helper'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db('mongoid-textile')
end

class Article
  include Mongoid::Document
  include Mongoid::Textile
  
  field :text
  
  textlize :text
end

describe Mongoid::Textile do
  let(:article) { Article.create(text: 'h1. proud to be a rails developer') }
  
  it 'should build a dynamic field for textilized fields' do
    article.should respond_to(:text_formatted)
  end
  
  it 'should set formatted field from textile to html' do
    article.text_formatted.should eq('<h1>proud to be a rails developer</h1>')
  end
end
