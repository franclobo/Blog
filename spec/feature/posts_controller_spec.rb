require 'rails_helper'
describe 'Posts', type: :feature do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 1)
  end
  it 'should have a list of posts' do
    visit '/users/:user_id/posts'
    expect(page).to have_content('Tom')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Hello')
    expect(page).to have_content('This is my first post')
  end
end
