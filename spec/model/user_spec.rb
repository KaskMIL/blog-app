require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'Link to photo', bio: 'Users bio') }

  before { subject.save }

  it 'name must not to be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter should be equal or greater than 0' do
    subject.postCounter = nil
    expect(subject).to_not be_valid
    subject.postCounter = -1
    expect(subject).to_not be_valid
  end

  it 'recent_post should return an array with 3 elements' do
    expect(subject.recent_post).to be_kind_of Array
    expect(subject.recent_post.length).to be_between(0, 3)
  end
end
