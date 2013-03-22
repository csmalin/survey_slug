require 'faker'

50.times do 
  User.new :email => Faker::Internet.email,
              :password_hash => "password",
              :username => Faker::Lorem.name
end

10.times do
  Survey.create :description => Faker::Lorem.sentence,
                :title => Faker::Name.title,
                :user_id => rand(1..50)
end

100.times do
  Question.create :inquisition => Faker::Lorem.sentence,
                  :survey_id => rand(1..10)
end

100.times do
  Option.create :choice => Faker::Lorem.sentence,
                :question_id => rand(1..100)
end

100.times do
  Response.create :active_survey_id => rand(1..10),
                  :option_id => rand(1..100),
                  :question_id => rand(1..100)
end

10.times do
  ActiveSurvey.create :response_id => rand(1..100),
                      :survey_id => rand(1..100),
                      :user_id => rand(1..100)
end
