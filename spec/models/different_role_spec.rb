require 'rails_helper'

RSpec.describe DifferentRole, type: :model do
  describe 'relationships' do
    it {should belong_to(:movie)}
    it {should belong_to(:actor)}

  end
end
