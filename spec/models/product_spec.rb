require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validate name exists" do
      @category = Category.find_or_create_by! name: 'New Category'

      @product = @category.products.create!({
        name:  "Men's not so classy shirt",
        description: "cat test description",
        quantity: 10,
        price: 64.99
      })
      expect(@product.name).to be_present 
    end    
    it "validate name doesn't exists" do
      @category = Category.find_or_create_by! name: 'New Category'

      @product = @category.products.create!({
        name:  nil,
        description: "cat test description",
        quantity: 10,
        price: 64.99
      })
      puts @product.errors.full_messages
      expect (@product.errors.full_messages).to include ("name doesn't exists")
    end 
    it "validate price exists" do
      @category = Category.create name: 'New Category'

      @product = @category.products.create!({
        name:  'Men\'s Classy shirt',
        description: "cat test description",
        quantity: 10,
        price: 64.99
      })
      expect(@product.price).to be_present 
    end    
    it "validate quantity exists" do
      @category = Category.find_or_create_by! name: 'New Category'

      @product = @category.products.create!({
        name:  'Men\'s Classy shirt',
        description: "cat test description",
        quantity: 10,
        price: 64.99
      })
      expect(@product.quantity).to be_present 
    end    
    it "validate category exists" do
      @category = Category.find_or_create_by! name: 'New Category'

      @product = @category.products.create!({
        name:  'Men\'s Classy shirt',
        description: "cat test description",
        quantity: 10,
        price: 64.99
      })
      expect(@product.category).to be_present 
    end    
  end
end
