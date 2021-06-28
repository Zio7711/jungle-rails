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






  end

end
