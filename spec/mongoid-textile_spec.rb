# encoding: utf-8

require "spec_helper"

class Article
  include Mongoid::Document
  include Mongoid::Textile
  
  field :text
  
  textlize :text
end

class Post
  include Mongoid::Document
  include Mongoid::Textile
  
  field :text, :localize => true
  
  textlize :text
end

describe Mongoid::Textile do
  let(:article) { Article.create(:text => "h1. proud to be a rails developer") }
  
  it "should build a dynamic field for textilized fields" do
    article.should respond_to(:text_formatted)
  end
  
  it "should set formatted field from textile to html" do
    article.text_formatted.should eq("<h1>proud to be a rails developer</h1>")
  end

  it "should change textlized text" do
    article.text = "p. ruby makes me happy"
    article.save

    article.text_formatted.should eq("<p>ruby makes me happy</p>")
  end
  
  context "when text is nil" do
    let(:article) { Article.create(:text => nil) }
    
    it "should set formatted field with an empty string" do
      article.text_formatted.should eq("")
    end
  end

  context "when text is localized and is not present" do
    let(:post) { Post.create }

    it "should set formatted translations field with an empty hash" do
      post.text_formatted_translations.should eq({})
      post.text_formatted.should eq(nil)
    end
  end
  
  context "when text is empty" do
    let(:article) { Article.create(:text => "") }
    
    it "should set formatted field with an empty string" do
      article.text_formatted.should eq("")
    end
  end
  
  context 'multiple languages' do
    let(:post) { Post.create(:text_translations => { 'en' => 'h1. ruby makes me happy', 'de' => 'h1. ruby macht mich glücklich' }) }
    
    context 'in english' do
      before :all do
        I18n.locale = :en
      end
      
      it 'should set formatted field from textile to html' do
        post.text_formatted.should eq('<h1>ruby makes me happy</h1>')
      end
    end
    
    context 'in german' do
      before :all do
        I18n.locale = :de
      end
      
      it 'should set formatted field from textile to html' do
        post.text_formatted.should eq('<h1>ruby macht mich glücklich</h1>')
      end
    end
  end

end
