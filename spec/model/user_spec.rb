require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'Link to photo', bio: 'Users bio') }

  before { subject.save }

  it 'name must not to be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter should not be valid' do
    subject.postCounter = nil
    expect(subject).to_not be_valid
  end
end
