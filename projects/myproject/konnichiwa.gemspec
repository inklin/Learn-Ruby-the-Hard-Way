# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

GEM::Specification.new do |spec|
  spec.name         = "konnichiwa"
  spec.version      = '1.0'
  spec.authors      = ["Stacey Lin"]
  spec.email        = ["twstacey@gmail.com"]
  spec.summary      = %q{A simple Hello World gem.}
  spec.description  = %q{Longer description of your project.}
  spec.homepage     = "http://domainforproject.com"
  spec.license      = "MIT"

  spec.files          = ['lib/konnichiwa.rb']
  spec.executables    = ['bin/greet']
  spec.test_files     = ['tests/test_konnichiwa.rb']
  spec.require_paths  =["lib"]
end