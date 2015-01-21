require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @post = user.posts.build(title: 'Title', content: 'Lorem ipsum', category_id: 1)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:category_id) }
  it { should respond_to(:views) }
  it { should respond_to(:likes) }

  it { should be_valid }

  its(:user) { should eq user }
  its(:view) { should eq 0 }
  its(:likes) { should eq 0 }

  describe  'when user_id is not present' do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank title' do
    before { @post.title = ' ' }
    it { should_not be_valid }
  end

  describe 'with title that  it too long' do
    before { @post.title = 'a' * 200 }
    it { should_not be_valid }
  end

  describe 'with blank content' do
    before { @post.content = ' ' }
    it { should_not be_valid }
  end

end
