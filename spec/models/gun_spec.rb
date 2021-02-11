require 'rails_helper'

RSpec.describe Gun, type: :model do

  current_user = User.first_or_create(email: 'test@example',password: 'password', password_confirmation: 'password')

  it 'validates condition' do  
    gun = Gun.new(model: 'M16', year: 1976, user: current_user)

    expect(gun).to_not be_valid

    gun.condition = 'good'

    expect(gun).to be_valid
  end

  it 'validates year' do 
    gun = Gun.new(model: 'M16', condition: 'good', user: current_user)

    expect(gun).to_not be_valid

    gun.year = 1977

    expect(gun).to be_valid
  end

  it 'validates model' do 
    gun = Gun.new(year: 1977, condition: 'good', user: current_user)

    expect(gun).to_not be_valid

    gun.model = 'AK-47'

    expect(gun).to be_valid
  end

end
