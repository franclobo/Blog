require 'rails_helper'
RSpec.describe Comment, type: :model do
  it 'text is present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'text is less than or equal to 250' do
    subject.text = 'a' * 251
    expect(subject).to_not be_valid
  end
  it 'user_id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it 'post_id is present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
