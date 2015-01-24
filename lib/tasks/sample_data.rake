namespace :db do
  desc 'Fill database sample data'
  task populate: :environment do
    make_users
    make_posts
  end
end

def make_users
  User.create!(login: 'endenwer',
               email: 'endenwer@gmail.com',
               password: 'foobar12',
               password_confirmation: 'foobar12')

  20.times do |n|
    login = "#{ Faker::Internet.user_name }_#{ n }"
    email = Faker::Internet.email(login)
    password = 'foobar12'
    User.create!(login: login,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_posts
  users = User.limit(5)
  50.times do
    users.each do |user|
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(300)
      user.posts.create!(title: title, content: content)
    end
  end
end



