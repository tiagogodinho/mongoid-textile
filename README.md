# Mongoid Textile

[![Build Status](https://travis-ci.org/tiagogodinho/mongoid-textile.svg?branch=master)](https://travis-ci.org/tiagogodinho/mongoid-textile)
[![Dependency Status](https://gemnasium.com/tiagogodinho/mongoid-textile.svg)](https://gemnasium.com/tiagogodinho/mongoid-textile)
[![Gem Version](https://badge.fury.io/rb/mongoid-textile.svg)](http://badge.fury.io/rb/mongoid-textile)
[![Coverage Status](https://img.shields.io/coveralls/tiagogodinho/mongoid-textile.svg)](https://coveralls.io/r/tiagogodinho/mongoid-textile?branch=master)
[![Code Climate](https://codeclimate.com/github/tiagogodinho/mongoid-textile/badges/gpa.svg)](https://codeclimate.com/github/tiagogodinho/mongoid-textile)

Textile texts directly from MongoDB.

Mongoid Textile caches Textile texts on MongoDB to eliminate reprocessing.

## Installation

Add this line to your application's `Gemfile`:

``` ruby
gem 'mongoid-textile'
```

And then execute:

``` terminal
bundle
```

Or install it yourself as:

``` terminal
gem install mongoid-textile
```

## Usage

``` ruby
class Article
  include Mongoid::Document
  include Mongoid::Textile

  field :text

  textlize :text
end

article = Article.create(text: 'h1. Proud to be a rails developer')

article.text_formatted #=> <h1>Proud to be a rails developer</h1>
```

## Compatibility

Mongoid Textile is tested against Ruby 1.9.3, 2.0.0 and 2.1.0.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Maintainers

* Lucas Renan (https://github.com/lucasrenan)
* Tiago Godinho (https://github.com/tiagogodinho)

## License

MIT License. Copyright 2012-2014 Lucas Renan e Tiago Rafael Godinho
