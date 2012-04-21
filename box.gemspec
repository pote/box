require File.join([File.dirname(__FILE__),'lib','box', 'version.rb'])

spec = Gem::Specification.new do |s|
  s.name = 'box'
  s.version = Box::VERSION
  s.author = 'Pablo Astigarraga'
  s.email = 'pote@tardis.com.uy'
  s.homepage = 'http://poteland.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A dead simple inline filesystem for your ruby scripts'
  s.files = %w(
lib/box.rb
lib/box/version.rb
  )
  s.require_paths << 'lib'
  s.add_development_dependency('rake')
end
