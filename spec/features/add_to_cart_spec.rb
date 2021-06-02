require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path
    expect(page).to have_content("My Cart (0)")

    first(:button,"Add").click

    expect(page).to have_content("My Cart (1)")
  end

end