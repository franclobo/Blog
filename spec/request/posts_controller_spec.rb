require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    User.destroy_all
    Post.destroy_all
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(id: 1, user_id: @user, title: 'Hello', text: 'This is my first post')
    @post.save
  end
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' } # get(:index)
    it 'it is a success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'should have a user name' do
      expect(response.body).to include('Tom')
    end
  end
end
