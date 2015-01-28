require 'spec_helper'

describe 'Posts' do

  subject{ page }

  describe 'Post page' do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:post) { user.posts.create(title: 'title', content: 'content for a post', category_id: 1) }
    before { visit post_path(post) }

    it { should have_title(post.title) }
    it { should have_content(post.title) }
    it { should have_content(post.content) }
    it { should have_content(post.user.login) }
    it { should have_link(category_path(Category.find(post.category_id))) }

    describe 'for signed-in users' do
      before do
        sign_in user
        visit post_path(post)
      end

      it { should_not have_field('email') }
      it { should_not have_field('name') }

      describe 'when user is a author this post' do
        it { should have_link(edit_post_path(post))}
      end

      describe 'when user is not a autor this post' do
        let!(:not_author) { FactoryGirl.create(:user)  }
        before do
          sign_in not_author
          visit post_path(post)
        end

        it { should_not have_link(edit_post_path(post)) }
      end

      describe 'when user commit a comment' do

        describe 'with valid information' do
          before do
            fill_in 'content', with: 'My comment'
          end

          it 'should create a comment for this post' do
            expect { click_button('Отправить') }.to change(Post, :count).by(1)
          end
        end

        describe 'with invalid information' do
          it 'should not create a comment' do
            expect { click_button('Отправить') }.not_to change(Post, :count)
          end
        end
      end
    end

    describe 'for non-signed-in users' do
      it { should_not have_link(edit_post_path(post)) }
      it { should have_field('email') }
      it { should have_field('name') }

      describe 'when user commit a comment' do

        describe 'with valid information' do
          before do
            fill_in 'content', with: 'My comment'
            fill_in 'name', with: 'My name'
            fill_in 'email', with: 'My email'
          end

          it 'should create a comment for this post' do
          expect { click_button 'Отправить' }.to change(Post, :count ).by(1)
        end
        end

        describe 'with invalid information' do
          it 'should not create comment' do
            expect { click_button 'Отправить' }.not_to change(Post, :count)
          end
        end
      end
    end
  end
end