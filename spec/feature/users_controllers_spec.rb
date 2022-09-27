require 'rails_helper'

describe 'Users', type: :feature do
  before(:all) do
    User.destroy_all
    @user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
  end
  it 'should have a list of users' do
    visit '/users'
    expect(page).to have_content('Tom')
  end
  it 'should have a user name' do
    visit '/users/1'
    expect(page).to have_content('Tom')
  end
  it 'should have a user photo' do
    visit '/users/1'
    expect(page).to have_css('img')
  end
  it 'I can see the number of posts' do
    visit '/users/1'
    expect(page).to have_content('0')
  end
  it 'When I click on the user name, I am redirected to the user page' do
    visit '/users'
    click_link('Tom')
    expect(page).to have_content('Tom')
  end
  describe 'GET #show' do
    it 'I can see the user picture' do
      visit '/users/1'
      expect(page).to have_css('img')
    end
    it 'I can see the user name' do
      visit '/users/1'
      expect(page).to have_content('Tom')
    end
    it ' I can see the number of posts' do
      visit '/users/1'
      expect(page).to have_content('0')
    end
    it 'I can see the user bio' do
      visit '/users/1'
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'I can see the user 3 posts' do
      visit '/users/1'
      expect(page).to have_content('0')
    end
    it 'I can see a button to see all post' do
      visit '/users/1'
      expect(page).to have_content('All Post')
    end
    it 'When I click on the button, I am redirected to the user post page' do
      visit '/users/1'
      click_link('Hello')
      expect(page).to have_content('Tom')
    end
    it 'When I click on see all post, I am redirected to the user post page' do
      visit '/users/1'
      click_link('All Post')
      expect(page).to have_content('Tom')
    end
  end
end
