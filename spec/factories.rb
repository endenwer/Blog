FactoryGirl.define do
  factory :user do
    sequence(:login) { |n| "person_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'foobar12'
    password_confirmation 'foobar12'
  end

  factory :post do
    title 'Title of a post'
    content 'Content of a post. Lorem ipsum'
    user
  end

  factory :comment do
    content 'My comment'
    post_id 1
    user
  end
end