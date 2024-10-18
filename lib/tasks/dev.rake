desc "Fill the database tables with some sample data"
task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    FollowRequest.destroy_all
    Comment.destroy_all
    Like.destroy_all
    Photo.destroy_all
    User.destroy_all
  end

  usernames = Array.new { Faker::Name.first_name }

  usernames << "alice"
  usernames << "bob"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      private: [true, false].sample,
    )
  end

  12.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name.downcase,
      private: [true, false].sample,
    )
  end

  users = User.all
  
  users.each do |first_user|
    users.each do |second_user|
      next if first_user == second_user
      if rand < 0.75
        first_user.sent_follow_requests.create(
          recepient: second_user,
          status: FollowRequest.statuses.values.sample
        )
      end

      if rand < 0.75
        second_user.sent_follow_requests.create(
          recepient: first_user,
          status: FollowRequest.statuses.values.sample
        )
      end
    end
  end

  users.each do |user|
    rand(15).times do
      photo = user.own_photos.create(
        caption: Faker::Lorem.sentence,
        image: "https://robohash.org/#{rand(9999)}"
      )

      user.follow_requests.each do |follow_request|
        if rand < 0.5 && !photo.fans.include?(follow_request)
          photo.fans << follow_request
        end

        if rand < 0.25
          photo.comments.create(
            body: Faker::Lorem.sentence,
            author: follow_request
          )
        end
      end
    end
  end
  p "There are now #{User.count} follows requestion."
  p "There are now #{FollowRequest.count} follows requestion."
  p "There are now #{Photo.count} follows requestion."
  p "There are now #{Like.count} follows requestion."
  p "There are now #{Comment.count} follows requestion."
end
