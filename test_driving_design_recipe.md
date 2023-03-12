# {POST /sort-names} Route Design Recipe


## 1. Design the Route Signature

You'll need to include:
  * the HTTP method = POST
  * the path = /sort-names
  * any query parameters (passed in the URL) : names=Joe,Alice,Zoe,Julia,Kieran

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->
Alice,Joe,Julia,Kieran,Zoe
```


## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /sort-names
body parameter => names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:
=> Alice,Joe,Julia,Kieran,Zoe
Response for 200 OK
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kiearan,Zoe")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---