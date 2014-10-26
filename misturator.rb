require 'sinatra'
require 'slim'

get '/' do
  slim :home, :format => :html5
end

get '/sorteio' do
  @participants = File.open('lista.txt').
    readlines.
    map(&:chomp).
    shuffle
  @participant = @participants.shift
  File.open('lista.txt', 'w') {|f| f.write @participants.join("\n") }
  slim :home, :format => :html5
end

get '/apoio' do
  slim :supporters, :format => :html5
end
