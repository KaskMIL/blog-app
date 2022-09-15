require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(title: 'something', text: 'test', author: User.new(name: 'Tom')) }

  it 'title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characteres' do
    (1..251).each do |i|
      subject.title += i.to_s
    end
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be equal or greater than 0' do
    subject.commentsCounter = nil
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be equal or greater than 0' do
    subject.likesCounter = nil
    expect(subject).to_not be_valid
  end

  it 'recent_comment should return an array with 5 elements' do
    expect(subject.recent_comment).to be_kind_of Array
    expect(subject.recent_comment.length).to be_between(0,5)
  end
end
