require 'rails_helper'

RSpec.describe Customer, type: :model do
  #Association Test
  it { should have_many(:orders)}
  #Validation Tests
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:age)}
  it { should validate_presence_of(:phone_number) }

end
