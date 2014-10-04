$:.push File.expand_path('../lib', __FILE__)

require 'shower/version'

Gem::Specification.new do |s|
  s.name        = 'shower'
  s.version     = Shower::VERSION
  s.authors     = 'Kevin Pheasey'
  s.email       = 'kevin.pheasey@gmail.com'
  s.homepage    = 'https://github.com/kpheasey/shower'
  s.summary     = 'Rails JSON Streaming'
  s.description = 'Create JSON streams for any action without locking up your database.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.0.0'
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'redis', '~> 3.1.0'
end
