require 'spec_helper'

describe User do

  before do
    @user = User.new(login: 'endenwer',
                     email: 'endenwer@gmail.com',
                     password: 'foobar12',
                     password_confirmation: 'foobar12')
  end

  subject { @user }

  it { should respond_to(:login) }
  it { should respond_to(:posts) }
  it { should respond_to(:comments) }

  it { should be_valid }

  describe 'with name is not present' do
    before { @user.login =  ' '  }
    it { should_not be_valid }
  end

  describe 'with name is too long' do
    before { @user.login = 'a' * 31 }
    it { should_not be_valid }
  end

  describe 'with email is already token' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email =  @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe 'email with mixed case' do
    let(:mixed_case_login) { 'UsEr@mAil.ru' }

    it 'should be saved as all lower-case' do
      @user.login = mixed_case_login
      @user.save
      expect(@user.reload.login).to eq mixed_case_login.downcase
    end
  end

  describe 'post associated' do
    before { @user.save }

    let!(:older_post) { FactoryGirl.create(:post, user: @user, created_at: 1.day.ago) }
    let!(:newer_post) { FactoryGirl.create(:post, user: @user, created_at: 1.hour.ago) }

    it 'should have the right post in the right order' do
      expect(@user.posts.to_a).to eq [newer_post, older_post]
    end

    it 'should destroy associated posts' do
      posts = @user.posts.to_a
      @user.destroy
      expect(posts).not_to be_empty
      posts.each do |post|
        expect(Post.where(id: post.id)).to be_empty
      end
    end
  end
end
