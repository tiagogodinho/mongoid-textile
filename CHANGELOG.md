## 0.2.0 - July 11, 2012

### Improvements

* Adding support to Mongoid 3.

### Major Changes (Backwards Incompatible)

* Mongoid Textile no longer supports Ruby 1.8.7 and 1.9.2 (if you use Mongoid 3).

## 0.1.1 - March 30, 2012

### Resolved Issues

* Sets an empty hash to formatted translations field when field is localized and empty. ([@lucasrenan][]) commit: [3ae3e981d1][]

## 0.1.0 - February 14, 2012

### Improvements

* Inclusion of support for localized fields.

## 0.0.2 - January 17, 2012

### Improvements

* Removing InstanceMethods module inside of ActiveSupport::Concern because it is deprecated on ActiveSupport 3.2.0.

## 0.0.1 - January 11, 2012

Initial release.

[3ae3e981d1]: https://github.com/tiagogodinho/mongoid-textile/commit/3ae3e981d108013350988b659873f857a5beafcd
[@lucasrenan]: https://github.com/lucasrenan