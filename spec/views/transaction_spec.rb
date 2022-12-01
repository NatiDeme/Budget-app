require 'rails_helper'

RSpec.describe 'category/transaction.html.tailwindcss', type: :feature do
  describe 'Tesing the creation of category' do
    before :all do
      @user1 = User.create(name: 'Nati', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      @group1 = Group.create(name: 'Cloth', icon: 'https://www.pngitem.com/pimgs/m/421-4214640_clip-art-clothes-icon-clothing-icon-hd-png.png', user: @user1)
      @transaction1 = Entity.create(name: 'T-shirt', amount: '20', user: @user1)
      @entitygroup = GroupEntity.create(entities: @transaction1, groups: @group1)
    end
    it 'shows transaction' do
      visit root_path
      click_link 'Log in'
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      click_on(class: 'card1', match: :first)
      expect(page).to have_content('T-shirt')
    end
    it 'shows transaction amount' do
      visit root_path
      click_link 'Log in'
      within('body') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      sleep 3
      click_on(class: 'card1', match: :first)
      expect(page).to have_content('20')
    end
  end
end
