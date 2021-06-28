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
    end




  end

end
