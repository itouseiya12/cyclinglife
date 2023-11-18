FactoryBot.define do
  factory :user do
    name { "TestUser" }
    email { "TestUser@test.com" } 
    password { "password123" }
    password_confirmation { "password123" }
    profile { "profiletext" }
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default_avator_image.png')) }
  end
end
