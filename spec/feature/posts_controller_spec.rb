require 'rails_helper'
describe 'Posts', type: :feature do
  before(:all) do
    User.destroy_all
    @user = User.create(id: 50, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', post_counter: 1)
    @post = Post.create(id: 1, user_id: @user.id, title: 'Hello', text: 'This is my first post',
                        comments_counter: 1, likes_counter: 1)
  end
  it 'should have a list of posts' do
    visit '/users/:user_id/posts'
    expect(page).to have_content('Tom')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Hello')
    expect(page).to have_content('This is my first post')
  end
end
