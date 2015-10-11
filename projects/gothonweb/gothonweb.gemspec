# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

GEM::Specification.new do |spec|
  spec.name         = "NAME"
  spec.version      = '1.0'
  spec.authors      = ["Stacey Lin"]
  spec.email        = ["twstacey@gmail.com"]
  spec.summary      = %q{Short summary of your project}
  spec.description  = %q{Longer description of your project.}
  spec.homepage     = "http://domainforproject.com"
  spec.license      = "MIT"

  spec.files          = ['lib/NAME.rb']
  spec.executables    = ['bin/NAME']
  spec.test_files     = ['tests/test_NAME.rb']
  spec.require_paths  =["lib"]
end