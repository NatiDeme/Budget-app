require 'rails_helper'

RSpec.describe "category/category.html.tailwindcss", type: :feature do
  describe 'Tesing the creation of category' do
    before :all do
      @user1 = User.create(name: 'Nati', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @group1 = Group.create(name: 'Cloth', icon: 'https://www.pngitem.com/pimgs/m/421-4214640_clip-art-clothes-icon-clothing-icon-hd-png.png', user: @user1)
    end
     it 'shows category' do
      visit root_path
      click_link 'Log in'
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_content('Cloth')
    end
    it 'shows icon' do
      visit root_path
      click_link 'Log in'
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      expect(page).to have_css('img')
    end
  end
end
