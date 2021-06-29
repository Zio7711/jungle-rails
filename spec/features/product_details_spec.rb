require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true  do
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

  scenario "Should see product details" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    page.find('.pull-right', match: :first).click
    expect(page).to have_text 'Description', count: 1
    expect(page).to have_css '.product-detail'

    save_screenshot "product-details.png"

  end


end





  

