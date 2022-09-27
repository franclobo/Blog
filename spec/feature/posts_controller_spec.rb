require 'rails_helper'
# check testing
describe 'Posts', type: :feature do
  before(:all) do
    User.destroy_all
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(id: 1, user_id: @user, title: 'Hello', text: 'This is my first post')
  end
  it 'should have a list of posts' do
    visit '/users/1/posts'
    expect(page).to have_content('Tom')
  end
end
