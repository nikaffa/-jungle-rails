require 'rails_helper'

RSpec.feature "Visitors navigate from the home page to the product detail page", type: :feature, js: true do

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

  #click one of the product partials in order to navigate directly to a product detail page.
  scenario "They se a product detail page" do
    # ACT
    visit root_path

    first('article.product').find_link('Details').click

    # DEBUG / VERIFY
    # commented out b/c it's for debugging only
    save_and_open_screenshot

    # VERIFY 
    expect(page).to have_css 'article.product-detail'
  end


end
