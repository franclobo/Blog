require 'rails_helper'
RSpec.describe Like, type: :model do
  it 'user_id is present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it 'post_id is present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
