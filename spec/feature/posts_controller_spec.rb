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
  it 'I can see the user profile picture' do
    visit '/users/1/posts'
    expect(page).to have_css('img')
  end
  it 'I can see the user name' do
    visit '/users/1/posts'
    expect(page).to have_content('Tom')
  end
  it 'I can see the number of posts' do
    visit '/users/1/posts'
    expect(page).to have_content('0')
  end
  it 'I can see the post title' do
    visit '/users/1/posts'
    expect(page).to have_content('Hello')
  end
  it 'I can see the post text' do
    visit '/users/1/posts'
    expect(page).to have_content('This is my first post')
  end
  it 'I can see the first comment' do
    visit '/users/1/posts'
    expect(page).to have_content('No comments yet')
  end
  it 'I can see the number of comments' do
    visit '/users/1/posts'
    expect(page).to have_content('0')
  end
  it 'I can see the number of likes' do
    visit '/users/1/posts'
    expect(page).to have_content('0')
  end
  it 'When I click on a post, it redirects me to that post show page' do
    visit '/users/1/posts'
    click_link('Hello')
    expect(page).to have_content('Hello')
  end
end
