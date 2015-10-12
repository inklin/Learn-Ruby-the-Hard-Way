require './bin/app.rb'
require 'test/unit'
require 'rack/test'
class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_hello_form
    get '/hello/'
    assert last_response.ok?
    assert last_response.body.include?('A Greeting')
  end

  def test_hello_form_post
    post '/hello/', params={:name => 'Stacey', :greeting => 'Hi'}
    assert last_response.ok?
    assert last_response.body.include?('I just wanted to say')
  end

end