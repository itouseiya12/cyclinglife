FactoryBot.define do
  factory :post do
    location { "testplace" }
    text{ "testtext" } 
    postimage { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/Tokyo_image.png')) }
    address { "東京" }
    association :user
  end
end
