require 'rails_helper'

RSpec.describe Order, type: :model do
  #Association Test
  it { should belong_to(:customer)}
  #Validation Tests
  it { should validate_presence_of(:item_name)}
end
