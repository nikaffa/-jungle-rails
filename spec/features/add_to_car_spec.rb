require 'rails_helper'

RSpec.feature "Visitors click the 'Add to Cart' button for a product on the home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  #can visit the home page, click the 'Add to Cart' button for a product and their cart increases by one
  scenario "They see their cart increased by one" do
    # ACT
    visit root_path
    first('button.btn-primary').click

    # DEBUG / VERIFY
    # commented out b/c it's for debugging only
    save_and_open_screenshot

    # VERIFY 
    expect(page).to have_text 'My Cart (1)'
  end


end
