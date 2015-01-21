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
    before { user.name = 'a' * 30 }
    it { should_not be_valid }
  end

  describe 'post associated' do
    before { user.save }

    let!(:older_post) { FactoryGirl.create(:post, user: @user, created_at: 1.day.ago) }
    let!(:newer_post) { FactoryGirl.create(:post, user: @user, created_at: 1.hour.ago) }

    it 'should have the right post in the right order' do
      expect(@user.posts.to_a).to eq [newer_post, older_post]
    end

    it 'should destroy associated posts' do
      posts = @user.post.to_a
      @user.destroy
      expect(posts).not_to be_empty
      post.each do |post|
        expect(Post.where(id: post.id)).to be_empty
      end
    end
  end
end
