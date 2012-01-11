# Mongoid::Textile

Textile texts directly from MongoDB.

Mongoid Textile caches Textile texts on MongoDB to eliminate reprocessing.

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-textile'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-textile

## Usage

``` ruby
class Article
  include Mongoid::Document
  
  field :text
  
  textilize :text
end

article = Article.create(text: 'h1. Proud to be a rails developer')

article.text_formatted #=> <h1>Proud to be a rails developer</h1>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License. Copyright 2012 Tiago Rafael Godinho
