require 'rails_helper'

RSpec.describe Cast do
  describe 'relationships' do
    it { should belong_to(:movie) }
    it { should belong_to(:actor) }
  end
end
