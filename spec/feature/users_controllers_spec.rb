require 'rails_helper'

describe 'Users', type: :feature do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', post_counter: 1)
  end
  it 'should have a list of users' do
    visit '/users'
    expect(page).to have_content('Tom')
    expect(page).to have_content('Number of posts: 1')
  end
end
