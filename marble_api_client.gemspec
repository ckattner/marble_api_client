# frozen_string_literal: true

require './lib/marble_api_client/version'

Gem::Specification.new do |s|
  s.name        = 'marble_api_client'
  s.version     = MarbleApiClient::VERSION
  s.summary     = 'Library to simplify requests made to Marble Service Model.'

  s.description = <<-DESCRIPTION
    This library exists to simplify requests made to Marble Service Model (Still in progress).
    It offers simple objects to comply with the Marble Service Model request and response objects.
  DESCRIPTION

  s.authors     = ['Dan Dewar']
  s.email       = ['ddewar@bluemarblepayroll.com']
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.bindir      = 'exe'
  s.executables = []
  s.homepage    = 'https://github.com/bluemarblepayroll/marble_api_client'
  s.license     = 'MIT'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/bluemarblepayroll/marble_api_client/issues',
    'changelog_uri' => 'https://github.com/bluemarblepayroll/marble_api_client/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/marble_api_client',
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage
  }

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'acts_as_hashable', '~> 1'

  s.add_development_dependency('guard-rspec', '~>4.7')
  s.add_development_dependency('pry', '~>0')
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('rspec', '~>3.8')
  s.add_development_dependency('rubocop', '~>0.88.0')
  s.add_development_dependency('simplecov', '~>0.18.5')
  s.add_development_dependency('simplecov-console', '~>0.7.0')
  s.add_development_dependency('webmock', '~>3.7')
end
