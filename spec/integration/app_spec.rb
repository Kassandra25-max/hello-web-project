require "spec_helper"
require "rack/test"
require_relative "/Users/kassandrakalejaye/Makers Projects/hello_web_project/app"

describe Application do
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns html index' do
      response = get('/')

      expect(response.body).to include('<h1>Welcome to my page</h1>')
    end
  end

  context 'GET /hello' do
    it 'returns html hello' do
      response = get('/hello', name: 'Kassandra')

      expect(response.body).to include('<h1>Hello Kassandra!</h1>')
    end
  end

  context "GET to /names" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get('/names?names=Julia, Mary, Karim')

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST /sort-names" do
    it 'returns 200 OK with the right context' do
      # Assuming the post with id 1 exists.
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end