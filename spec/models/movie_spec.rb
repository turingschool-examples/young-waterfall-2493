require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:different_roles)}
    it {should have_many(:actors).through(:different_roles)}
  end
end
