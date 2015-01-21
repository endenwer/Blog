require 'spec_helper'

describe Category do

  before { @category = Category.new(name: 'Category name', description: 'Category description') }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:posts) }

  it { should be_valid }

  describe 'with blank name' do
    before { @category.name = ' ' }
    it { should_not be_valid }
  end

  describe 'with blank description' do
    before { @category.description = ' ' }
    it { should_not be_valid }
  end

  describe 'post associated' do
    before { @category.save }
    let(:post) { FactoryGirl.create(:post, category_id: @category.id) }

    it 'should have a post' do
      expect(@category.posts).to include(post)
    end
  end

end
