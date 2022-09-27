require 'rails_helper'
# check testing
describe 'Posts', type: :feature do
  before(:all) do
    User.destroy_all
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(user_id: @user.id, title: 'Hello', text: 'This is my first post')
    @comment = Comment.create(user_id: @user.id, post_id: @post.id, text: 'This is my first comment')
  end
  it 'should have a list of posts' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Tom')
  end
  it 'I can see the user profile picture' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_css('img')
  end
  it 'I can see the user name' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Tom')
  end
  it 'I can see the number of posts' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('0')
  end
  it 'I can see the post title' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('Hello')
  end
  it 'I can see the post text' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('This is my first post')
  end
  it 'I can see the first comment' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('This is my first comment')
  end
  it 'I can see the number of comments' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('0')
  end
  it 'I can see the number of likes' do
    visit "/users/#{@user.id}/posts"
    expect(page).to have_content('0')
  end
  it 'When I click on a post, it redirects me to that post show page' do
    visit "/users/#{@user.id}/posts"
    click_link('Hello')
    expect(page).to have_content('Hello')
  end
  describe 'GET #show' do
    it 'I can see the post title' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Hello')
    end
    it 'I can see the post author' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Tom')
    end
    it 'I can see how many comments the post has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('0')
    end
    it 'I can see how many likes the post has' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('0')
    end
    it 'I can see the post text' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('This is my first post')
    end
    it 'I can see the username of the comment author' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Tom')
    end
    it 'I can see the comment text' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('This is my first comment')
    end
  end
end
