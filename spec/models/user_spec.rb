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

    it "validate name exists" do
      expect(@user.name).to be_present 
    end    
  end

  describe '.authenticate_with_credentials' do

    it "logs in with correct email, password" do
      @user.save!
      userAuth = @user.authenticate_with_credentials("test@gmail.com","password123")
    end
    
    it "logs in with incorrect email, incorrect password" do
      @user.save!
      userAuth = @user.authenticate_with_credentials("test2@gmail.com","password1223")
    end
    
    it "logs in with incorrect email, correct password" do
      @user.save!
      userAuth = @user.authenticate_with_credentials("test2@gmail.com","password123")
    end
    
    it "logs in with correct email, incorrect password" do
      @user.save!
      userAuth = @user.authenticate_with_credentials("test@gmail.com","password1223")
    end
    
    it "logs in with correct email, password but form email is randomly upper cased" do
      @user.save!
      userAuth = @user.authenticate_with_credentials("TesT@GmaIl.com","password123")
    end
    
    it "logs in with correct email, password but db email is randomly upper cased" do
      user2 = User.new(
        email:"tEsT@gmail.com", 
        name:"Sam Smith", 
        password:"password123", 
        password_confirmation:"password123"
      )
      user2.save!
      userAuth = user2.authenticate_with_credentials("test@gmail.com","password123")
    end
    
    it "logs in with correct email, password but both db and form emails are randomly upper cased" do
      user2 = User.new(
        email:"tEsT@gmail.com", 
        name:"Sam Smith", 
        password:"password123", 
        password_confirmation:"password123"
      )
      user2.save!
      
      userAuth = user2.authenticate_with_credentials("TesT@gmAil.com","password123")
    end
  end
end
