require 'spec_helper'

describe 'Pages' do

  subject { page }

  describe 'Index page' do
    before { visit root_path }

    it { should have_title('Index page') }

    describe 'for signed in user' do
      let(:user) { FactoryGirl.create(:user) }

      before { sign_in user }

      it { should have_content(user.email)}
      it { should have_content('Sign out') }
    end

    describe 'for non-signed in user' do
      it { should have_content('Sign in') }
      it { should have_content('Sign up') }
    end
  end
end