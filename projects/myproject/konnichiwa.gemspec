# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name         = 'konnichiwa'
  spec.version      = '0.0.0'
  spec.date         = '2015-10-03'
  spec.authors      = ["Stacey Lin"]
  spec.email        = ["twstacey@gmail.com"]
  spec.summary      = %q{A simple Hello World gem.}
  spec.description  = %q{Longer description of your project.}
  spec.homepage     = "http://staceylin.com"
  spec.license      = "MIT"

  spec.files          = ['lib/konnichiwa.rb']
  spec.executables    = ['greet']
  spec.test_files     = ['tests/test_konnichiwa.rb']
  spec.require_paths  =['lib']
end