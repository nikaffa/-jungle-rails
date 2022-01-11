require 'rails_helper'

# An initial example that ensures that a product with all four fields set will indeed save successfully
# describe '.save' do
#   it "a product with all four fields set will indeed save successfully" do
#     @category = Category.new(name: "Books")
#     @category.save

#     @product = Product.new(name: "Learn Ruby in one day", price: 1500, quantity: 3, category: @category)
#     @product.save
#     expect(@product).to be_valid
#   end
# end

# As each example (it) runs in isolation of others, it needs its own @category created and then @product initialized with that category
RSpec.describe Product, type: :model do
  #initial fields set
  before(:all) do
    @category = Category.new(name: "Books")
    @product = Product.new(name: "Learn Ruby in one day", price: 1500, quantity: 3, category: @category)
    @product.save
  end
  
  it "is valid with all fields set" do
    expect(@product).to be_valid
  end

  it "is not valid without a name set" do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eql(["Name can't be blank"])
  end

  it "is not valid without a price set" do
    @product.price = nil
    expect(@product).to_not be_valid
    
  end

  it "is not valid without a quantity set" do
    @product.quantity = nil
    expect(@product).to_not be_valid
  end

  it "is not valid without a category set" do
    @product.category = nil
    expect(@product).to_not be_valid
  end

end