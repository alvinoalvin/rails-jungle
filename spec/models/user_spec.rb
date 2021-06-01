require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      email:"test@gmail.com", 
      name:"Sam Smith", 
      password:"password123", 
      password_confirmation:"password123"
    )
  end

  describe 'Validations' do
    it "validate password exists" do
      expect(@user.password.length).to be > (4) 
    end    

    it "checks min password length" do
      expect(@user.password).to be_present 
    end    
    
    it "validate password confirmation exists" do
      expect(@user.password_confirmation).to be_present 
    end    

    it "validate password confirmation same as password" do
      expect(@user.password).to eq @user.password_confirmation 
    end    

    it "validate password confirmation different as password" do
      @user2 = User.new(password:"password123", password_confirmation:"password_123")

      expect(@user2.password).not_to eq @user2.password_confirmation 
    end    

    it "validate Email exists" do
      expect(@user.email).to be_present 
    end    

    it "validate Email duplicates not allowed" do
      @user3 = User.new(email:"test@gmail.com", name:"Julius Salad", password:"password123", password_confirmation:"password123")
      @user.save
      @user3.save

      expect(@user3).to_not be_valid
      puts @user3.errors.messages[:email]
      expect(@user3.errors.messages[:email]).to include("has already been taken")
    end    

    it "validate f_name exists" do
      expect(@user.name).to be_present 
    end    

    it "validate L_name exists" do
      expect(@user.name).to be_present 
    end    

  end
end
