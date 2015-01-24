require 'spec_helper'

describe 'Pages' do

  subject { page }

  describe 'Index page' do
    before { visit root_path }

    it { should have_title('Index page') }

    describe 'for signed in user' do
      let(:user) { FactoryGirl.create(:user) }

      before { sign_in user }

      it { should have_content(user.login) }
      it { should have_content('Выйти') }
    end

    describe 'for non-signed in user' do
      it { should have_content('Войти') }
      it { should have_content('Регистрация') }
    end

    describe 'Feed of posts'  do
      let(:post){ Post.first }
      it { should have_content(post.title) }
      it { should have_content(post.content[0..300]) }
      it { should_not have_content(post.content[301..-1]) }
      it { should have_selector('article', count: 5) }

      # describe 'when click on button which load posts', js: true do
      #
      #   before do
      #     visit root_path
      #     click_button 'Еще'
      #   end
      #
      #   it { should have_selector('article', count: 10) }
      # end
    end
    end
  end
