require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'is valid with the correct attributes' do
    expect(subject).to be_valid
  end

  it 'name is present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter is greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
