require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Ai', email: 'ai@gmail.com',  password: '12345', password_confirmation: '12345')
    @user.save
  end
  
  describe 'Validations' do
    it 'creates a user if password and password_confirmation match' do
      expect(@user).to be_valid
    end

    it 'does not create a user if password and password_confirmation don"t match' do
      @user.password_confirmation = "12346"
      expect(@user).to_not be_valid
    end

    it "does not create a user without a password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "does not create a user if a password length is less than 5 characters" do
      @user.password = '1234'
      expect(@user).to_not be_valid
    end

    it "does not create a user if the name is blank" do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "does not create a user if email is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not create a user if email is already exists' do
      @user_with_existed_email = User.create(name: 'Vali', email: 'aali@gmail.com',  password: '12345', password_confirmation: '12345')
      expect(@user_with_existed_email).not_to be_valid
      expect(@user_with_existed_email.errors.full_messages).to include("Email has already been taken")
    end
  
  end

  describe '.authenticate_with_credentials' do

    it 'authenticates a user with a valid email and a password' do
      @user = User.create(name: 'Oui', email: 'oui@gmail.com',  password: '12345', password_confirmation: '12345')
      @session = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to eql(@session)
    end

    it 'does not authenticate a user without a valid email' do
      @user = User.create(name: 'Abi', email: 'oui@gmail.com',  password_digest: '12345', password_confirmation: '12345')
      @session = User.authenticate_with_credentials('@user.email', @user.password)
      expect(@user).to_not eql(@session)
    end

    it 'authenticates a user without a valid password' do
      @user = User.create(name: 'Alu', email: 'alu@gmail.com',  password_digest: '12345', password_confirmation: '12345')
      @session = User.authenticate_with_credentials(@user.email, '1234567')
      expect(@user).to_not eql(@session)
    end

    # it 'authenticates a user if email typed with surrounding spaces' do
    #   @user.email = ' aali@gmail.com  '
    #   @session = User.authenticate_with_credentials(@user.email, @user.password)
    #   expect(@user).to eql(@session)
    # end

    # it 'authenticates a user if email typed in wrong case' do
    #   @user.email = 'AALI@gmail.COM'
    #   @session = User.authenticate_with_credentials(@user.email, @user.password)
    #   expect(@user).to eql(@session)
    # end

  end

end
