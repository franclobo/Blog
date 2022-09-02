require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.create(title: 'Title', text: 'Text', user_id: 1) }
  before { subject.save }
  it 'title is present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'text is present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'user_id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
