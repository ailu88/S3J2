require_relative '../lib/user'

describe User do

  before(:each) do
    Object.send(:remove_const, 'User')
    load 'user.rb'
  end

	describe 'initializer' do
		it 'creates an user' do
			# creates a user
      user = User.new("email@email.com")

      # test if user has been created
      expect(user.class).to eq(User)
		end
	end

end