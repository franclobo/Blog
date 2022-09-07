require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    User.destroy_all
    @user = User.create(id: 53, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', post_counter: 1)
  end
  describe 'GET /users' do
    it 'assigns all users to @users' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
    end
  end
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'it is a success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    it 'renders the show template' do
      get '/users/53'
      expect(response).to render_template(:show)
    end
  end
end
