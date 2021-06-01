require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end

# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies

end
