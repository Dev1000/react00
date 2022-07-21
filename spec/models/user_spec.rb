# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has valid attributes' do
    user = User.create(email: 'lalo@lalo.com', password: '123456')
    puts "user: #{user.inspect}"
    #expect(user).to receive(:create_profile)
    user.run_callbacks(:create)
    #expect(user).to be_valid
  end


end
