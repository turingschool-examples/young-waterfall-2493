require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:blockbusters) }
    it {should have_many(:actors).through(:blockbusters) }
  end
end
