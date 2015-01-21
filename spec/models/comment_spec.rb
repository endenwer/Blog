require 'spec_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @comment = user.comments.build(content: 'content comment', post_id: 1);
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }
  it { should respond_to(:likes) }

  its(:likes) { should eq 0 }

  it { should be_valid }

  describe 'with blank content' do
    before { @comment.content = ' ' }
    it { should_not be_valid }
  end

  describe 'when user_id is not presence' do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when post_id is not presence' do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end

end
