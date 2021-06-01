require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many(:different_roles)}
    it {should have_many(:movies).through(:different_roles)}
  end
end
