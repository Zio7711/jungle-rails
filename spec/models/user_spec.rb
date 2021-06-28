require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should create a user" do
      @user = User.new(
        first_name: 'zio',
        last_name: 'tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user).to be_valid
    end


    it "should not create a user if the first_name is missing" do
      @user = User.new(
        last_name: 'tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it "should not create a user if the last_name is missing" do
      @user = User.new(
        first_name: 'tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it "should not create a user if the email is missing" do
      @user = User.new(
        first_name: 'tan',
        last_name: 'zio',

        password: '123',
        password_confirmation: '123'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "should not create a user if the email is not unique" do
      @user = User.new(
        first_name: 'tan',
        last_name: 'zio',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      @user2 = User.new(
        first_name: 'tan',
        last_name: 'zio',
        email: 'Zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user2).not_to be_valid
      expect(@user2.errors[:email]).to include("has already been taken")
    end

    it "should not create a user if the password is missing" do
      @user = User.new(
        first_name: 'tan',
        last_name: 'zio',
        email: 'Zio@tan.com',

        password_confirmation: '123'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "should not create a user if the password confirmation is different" do
      @user = User.new(
        first_name: 'tan',
        last_name: 'zio',
        email: 'Zio@tan.com',
        password: '123',
        password_confirmation: '321'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      
    end

    it "should not create a user if the password is less than 3 characters" do
      @user = User.new(
        first_name: 'tan',
        last_name: 'zio',
        email: 'Zio@tan.com',
        password: '12',
        password_confirmation: '12'
      )
      expect(@user).not_to be_valid
      expect(@user.errors[:password]).to include("is too short (minimum is 3 characters)")
      
    end

  end
  

    describe '.authenticate_with_credentials' do
      it 'should pass' do
      @user = User.new(
        first_name: 'Zio',
        last_name: 'Tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      @user = User.authenticate_with_credentials('zio@tan.com', '123')
      expect(@user).not_to be(nil)

    end

    it 'should not pass with wrong password' do
      @user = User.new(
        first_name: 'Zio',
        last_name: 'Tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      @user = User.authenticate_with_credentials('zio@tan.com', '321')
      expect(@user).to be(nil)
    end

    it 'should pass even with spaces in email' do
      @user = User.new(
        first_name: 'Zio',
        last_name: 'Tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      @user = User.authenticate_with_credentials(' zio@tan.com  ', '123')
      expect(@user).not_to be(nil)
    end

    it 'should pass even with caps in email' do
      @user = User.new(
        first_name: 'Zio',
        last_name: 'Tan',
        email: 'zio@tan.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      @user = User.authenticate_with_credentials('ZIO@tan.com', '123')
      expect(@user).not_to be(nil)
    end








    end

end



