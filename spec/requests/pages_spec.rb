require 'spec_helper'

describe 'Pages' do

  subject { page }

  describe 'Index page' do
    before { visit root_path }

    it { should have_title('Index page') }

    describe 'for signed in user' do
      let(:user) { User.create(email: 'foobar@mail.ru', password: 'foobar12', password_confirmation: 'foobar12') }

      before { sign_in user }

      it { should have_content(user.email)}
      it { should have_content('Sign out') }
    end
  end
end