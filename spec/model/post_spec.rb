require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(title: 'test', text: 'test', author: User.new(name: 'Tom')) }

  it 'title must not be valid' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
