require 'rails_helper'

RSpec.describe 'studio show page' do
  before(:each)do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Focus Films', location: 'London')
    @studio_3 = Studio.create!(name: 'Lucasfilm Ltd', location: 'San Francisco')

    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Adventure')
    @movie_2 = @studio_2.movies.create!(title: 'The Princess Bride', creation_year: 1987, genre: 'Romance')
    @movie_3 = @studio_3.movies.create!(title: 'The Empire Strikes Back', creation_year: 1980, genre: 'Adventure')
    @movie_4 = @studio_3.movies.create!(title: 'Return of the Jedi', creation_year: 1983, genre: 'Adventure')

    @actor_1 = Actor.create!(name: 'Mark Hamill', age: 69, working: true)
    @actor_2 = Actor.create!(name: 'Cary Elwes', age: 58, working: true)
    @actor_3 = Actor.create!(name: 'Harrison Ford', age: 78, working: false)

    ActorMovie.create!(actor: @actor_3, movie: @movie_3)
    ActorMovie.create!(actor: @actor_1, movie: @movie_3)
    ActorMovie.create!(actor: @actor_3, movie: @movie_4)
    ActorMovie.create!(actor: @actor_1, movie: @movie_4)
    ActorMovie.create!(actor: @actor_2, movie: @movie_2)
    ActorMovie.create!(actor: @actor_3, movie: @movie_2)
    ActorMovie.create!(actor: @actor_3, movie: @movie_1)
    ActorMovie.create!(actor: @actor_2, movie: @movie_4)  ##differs from seeds

  end

  it 'has the name & location of the studio' do
      visit "/studios/#{@studio_1.id}"
    expect(page).to have_content("#{@studio_1.name}")
    expect(page).to have_content("#{@studio_1.location}")
  end

  it 'has the titles of all the studios movies' do
      visit "/studios/#{@studio_3.id}"
    expect(page).to have_content(@movie_3.title)
    expect(page).to have_content(@movie_4.title)
    expect(page).to_not have_content(@movie_2.title)
  end

  it 'has a list of all studio movie actors with no duplicates, ordered oldest to youngest, only currently working' do
      visit "/studios/#{@studio_3.id}"
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to_not have_content(@actor_1.name)
  end
#
#   it 'has ordered the list of ingredients from most calories to least' do
#     visit "/chefs/#{chef.id}"
#
#     expect(ingredient5.name.capitalize).to appear_before(ingredient4.name.capitalize)
#     expect(ingredient4.name.capitalize).to appear_before(ingredient3.name.capitalize)
#     expect(ingredient3.name.capitalize).to appear_before(ingredient2.name.capitalize)
#     expect(ingredient2.name.capitalize).to appear_before(ingredient1.name.capitalize)
#   end
#
#   describe 'each dish has a button to delete the dish' do
#     it 'has a button next to each dish to delete the dish' do
#       chef = Chef.create!(name: "Anthony")
#       dish1 = chef.dishes.create!(name: "Yum", description: "Very yum")
#       dish2 = chef.dishes.create!(name: "Tasty", description: "Very tasty")
#
#       visit "/chefs/#{chef.id}"
#
#       within("#chef_dishes") do
#         within("#dish-#{dish1.id}") do
#           expect(page).to have_button("Delete Dish")
#           click_button("Delete Dish")
#           expect(current_path).to eq("/chefs/#{chef.id}")
#         end
#         expect(page).to_not have_content("#{dish1.name}")
#         expect(page).to_not have_content("#{dish1.description}")
#
#         within("#dish-#{dish2.id}") do
#           expect(page).to have_button("Delete Dish")
#           click_button("Delete Dish")
#           expect(current_path).to eq("/chefs/#{chef.id}")
#         end
#         expect(page).to_not have_content("#{dish2.name}")
#         expect(page).to_not have_content("#{dish2.description}")
#       end
#     end
#   end
# end
#
# #RYAN
# RSpec.describe "Chef Show Page" do
#   describe "As a visitor" do
#     context "When I visit a chefs show page" do
#       before :each do
#         @chef = Chef.create!(name: "Mario")
#         @dish_1 = Dish.create!(name: 'lasagna', description: 'vegan with red sauce', chef_id: @chef.id)
#         @dish_2 = Dish.create!(name: 'pizza', description: 'cheese and pepperoni', chef_id: @chef.id)
#         @dish_3 = Dish.create!(name: 'steak', description: 'filet with pepper sauce', chef_id: @chef.id)
#         @dish_4 = Dish.create!(name: 'shrimp', description: 'boiled and seasoned')
#         @ingredient_1 = Ingredient.create!(name: 'tomato', calories: 45)
#         @ingredient_2 = Ingredient.create!(name: 'flour', calories: 95)
#         @ingredient_3 = Ingredient.create!(name: 'pepperoni', calories: 60)
#         @ingredient_4 = Ingredient.create!(name: 'sausage', calories: 80)
#         @ingredient_5 = Ingredient.create!(name: 'carrot', calories: 30)
#         @ingredient_6 = Ingredient.create!(name: 'chili', calories: 25)
#         @dish_1.ingredients << [@ingredient_1, @ingredient_2, @ingredient_3]
#         @dish_2.ingredients << [@ingredient_2, @ingredient_3, @ingredient_4, @ingredient_5]
#         @dish_3.ingredients << [@ingredient_5, @ingredient_6]
#         visit chef_path(@chef)
#       end
#
#       it "Then I see the name of the chef" do
#         expect(page).to have_content(@chef.name)
#       end
#
#       it "And I see the names and descriptions of all the chefs dishes" do
#         within ".dish-describe" do
#           expect(page).to have_content(@dish_1.name)
#           expect(page).to have_content(@dish_2.name)
#           expect(page).to have_content(@dish_3.name)
#           expect(page).to have_content(@dish_1.description)
#           expect(page).to have_content(@dish_2.description)
#           expect(page).to have_content(@dish_3.description)
#         end
#       end
#
#       it "Then I see the name and calories of all ingredients used in dishes" do
#         within ".ingredients-describe" do
#           expect(page).to have_content(@ingredient_1.name)
#           expect(page).to have_content(@ingredient_1.calories)
#           expect(page).to have_content(@ingredient_2.name)
#           expect(page).to have_content(@ingredient_2.calories)
#           expect(page).to have_content(@ingredient_3.name)
#           expect(page).to have_content(@ingredient_3.calories)
#           expect(@ingredient_2.name).to appear_before(@ingredient_3.name)
#           expect(@ingredient_3.name).to appear_before(@ingredient_1.name)
#         end
#       end
#
#       context "I see a button next to each dish to remove it from this chef" do
#         it "When I click this button I am returned to the chefs show page" do
#           expect(page).to have_button('Remove')
#           click_on "Remove #{@dish_1.id}"
#           expect(current_path).to eq(chef_path(@chef))
#           expect(page).to_not have_content("Remove #{@dish_1.id}")
#         end
#       end
#
#       # describe "I see a section for most popular ingredients" do
#         # it "I see the three most popular ingredients that the chef uses" do
#         #   within ".popular-ingredients" do
#         #     expect(page).to have_content(@ingredient_2)
#         #     expect(page).to have_content(@ingredient_3)
#         #     expect(page).to have_content(@ingredient_5)
#         #     expect(page).to_not have_content(@ingredient_6)
#         #   end
#         # end
#       # end
#     end
#   end
end
