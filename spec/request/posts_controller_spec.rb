require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    User.destroy_all
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', post_counter: 1)
    @post = Post.create(id: 1, user_id: @user.id, title: 'Hello', text: 'This is my first post',
                        comments_counter: 1, likes_counter: 1)
  end
  describe 'GET /posts' do
    it 'assigns all posts to @posts' do
      get '/users/1/posts'
      expect(assigns(:posts)).to eq(Post.all)
    end
  end
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' } # get(:index)
    it 'it is a success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
  end
end
