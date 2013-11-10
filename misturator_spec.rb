ENV['RACK_ENV'] = 'test'

require './misturator'
require 'test/unit'
require 'rack/test'

class MisturatorTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_shows_scti_misturator_home
    get '/'
    assert last_response.ok?
    assert last_response.body.include? '<h1>misturator</h1>'
  end

  def test_it_should_remove_person_from_list_after_raffle
    length = File.open('lista.txt').readlines.length
    get '/sort'
    length_after_raffle = File.open('lista.txt').readlines.length
    assert_equal length_after_raffle, length - 1
    system('rm lista.txt; cp lista-bkp.txt lista.txt')
  end
end
