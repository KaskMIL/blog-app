require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(title: 'something', text: 'test', author: User.new(name: 'Tom')) }

  it 'title must not be valid' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characteres' do
    (1..251).each do |i|
      subject.title += i.to_s
    end
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should not be valid' do
    subject.commentsCounter = nil
    expect(subject).to_not be_valid
  end
end
