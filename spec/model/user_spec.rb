require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'Link to photo', bio: 'Users bio') }

  before { subject.save }

  it 'Name must not to be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should show the users name' do
    expect(subject.name).to eq 'Tom'
  end
end
