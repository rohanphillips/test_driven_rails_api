require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  #initialize test data
  let!(:customers) { create_list(:customer, 5)}
  let!(:customer_id) { customers.first.id }
  #Test suite for GET / customer
  describe 'GET /customers' do
    before { get '/api/v1/customers' }
    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  #Test suite for POST /customer
  describe 'POST /customer' do
    #valid payload
    let(:valid_customer) {{
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      age: Faker::Number.between(from: 1, to: 100),
      phone_number: Faker::PhoneNumber.phone_number
    }}
    context 'when request is valid' do
      before { post '/api/v1/customers', params: {customer: valid_customer} }
      it 'creates a customer' do
        expect(json["first_name"]).to eq(valid_customer[:first_name])
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/customers', params: {customer: {first_name: ""}}}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(json).to include("first_name" => ["can't be blank"])
        expect(json).to include("last_name" => ["can't be blank"])
        expect(json).to include("age" => ["can't be blank"])
        expect(json).to include("phone_number" => ["can't be blank"])
      end
    end
  end
  #Test suite for DELETE /customer/:id
  describe 'DELETE /customers/:id' do
    before { delete "/api/v1/customers/#{customer_id}"}
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end