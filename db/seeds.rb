# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

User.delete_all
Video.delete_all
Subject.delete_all
Comment.delete_all
Like.delete_all


# Test Users
user_file = File.read('./db/test_datafiles/users.json')
user_hash = JSON.parse(user_file)
user_hash.each do |user|
    User.create(name: user['name'], username: user['username'], email: user['email'], bio: user['bio'],
                password: "foobar", password_confirmation: "foobar")
end


# Create some test videos for the test users
User.all.each do |user|
    vid_name = "#{user.name}'s placeholder"
    user.videos << Video.create(name: vid_name)
end 


# Create some test data about the test videos
Video.all.each do |video|

    # Test Subject
    subject_name = ""
    if video.name == "Jenna Blank's video"
        subject_name = "Java"
    elsif video.name = "Josh Doolittle's video"
        subject_name = "Stocks 101"
    else 
        subject_name = "Math"
    end
    video.subjects << Subject.create(name: subject_name, grade_level: 10)


    # Test Comment
    video.comments << Comment.create(text: "Nice video!")

    # Test Like
    video.likes << Like.create(liked_by: User.first.id)

end

