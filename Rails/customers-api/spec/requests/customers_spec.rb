require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  #initialize test data
  let!(:customers) { FactoryBot.create_list(:customer, 5)}
  let!(:customer_id) { customers.first.id }
  #Test suite for GET / customer
  describe 'GET /customers' do
    before { get '/customers' }
    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

# RSpec.describe "Customers", type: :request do
#   describe "GET /customers" do
#     it "works! (now write some real specs)" do
#       get customers_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
