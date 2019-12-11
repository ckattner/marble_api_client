# Marble API Client

[![Gem Version](https://badge.fury.io/rb/marble_api_client.svg)](https://badge.fury.io/rb/marble_api_client) [![Build Status](https://travis-ci.org/bluemarblepayroll/marble_api_client.svg?branch=master)](https://travis-ci.org/bluemarblepayroll/marble_api_client)
[![Maintainability](https://api.codeclimate.com/v1/badges/fba9ec43303ca1595e5a/maintainability)](https://codeclimate.com/github/bluemarblepayroll/marble_api_client/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/fba9ec43303ca1595e5a/test_coverage)](https://codeclimate.com/github/bluemarblepayroll/marble_api_client/test_coverage)[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


This library is to simplify requests made to Marble Service Model (Still in procgress). This library offers simple objects to comply with the Marble Service Model request and response objects.
The library currently supports:

* Create
* Index

## Installation

To install through Rubygems:

````
gem install install marble_api_client
````

You can also add this to your Gemfile:

````
bundle add marble_api_client
````

## Examples

### Creating the client

A client can be created with a url and any headers that should be included
in all requests.
````ruby
client = MarbleApiClient::Proxy.new(
  'https://www.example.com:3000',
  headers: { 'Content-Type': 'application/json' }
)

````

### Making Request Objects

Create
````ruby
create_request_obj = Requests::Create.new(context: { key: 'value' },
                                          record: { key: 'value' })
````

Index
````ruby
index_request_obj = Requests::Index.new(context: { key: 'value' },
                                        record: { key: 'value' },
                                        page: 1,
                                        page_size: 25)
````

### Using the Client:

Create
````ruby
create_response = client.create('custom/path',
                                create_request_obj,
                                headers)
````

Index
````ruby
index_response = client.index('custom/path',
                               index_request_obj,
                               headers)
````

### Response Objects

Responses will be one of these response objects:

* Success
* BadRequest
* Unauthorized
* Forbidden
* NotFound
* UnprocessableEntity
* ServerError
* NotImplemented

## Contributing

### Development Environment Configuration

Basic steps to take to get this repository compiling:

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (check marble_api_client.gemspec for versions supported)
2. Install bundler (gem install bundler)
3. Clone the repository (git clone git@github.com:bluemarblepayroll/marble_api_client.git)
4. Navigate to the root folder (cd marble_api_client)
5. Install dependencies (bundle)

### Running Tests

To execute the test suite run:

````
bundle exec rspec spec --format documentation
````

Alternatively, you can have Guard watch for changes:

````
bundle exec guard
````

Also, do not forget to run Rubocop:

````
bundle exec rubocop
````

### Publishing

Note: ensure you have proper authorization before trying to publish new versions.

After code changes have successfully gone through the Pull Request review process then the following steps should be followed for publishing new versions:

1. Merge Pull Request into master
2. Update ```lib/marble_api_client/version.rb``` using [semantic versioning](https://semver.org/)
3. Install dependencies: ```bundle```
4. Update ```CHANGELOG.md``` with release notes
5. Commit & push master to remote and ensure CI builds master successfully
6. Run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in this codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bluemarblepayroll/marble_api_client/blob/master/CODE_OF_CONDUCT.md).

## License

This project is MIT Licensed.