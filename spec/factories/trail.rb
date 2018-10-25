FactoryBot.define do
  factory :trail do
    park
    name { "...and you will know is by the trail of dead" }
    uid { 1234567 }
    difficulty { "blue" }
    length { 4.6 }
    status { 0 }
    trail_img_url { "www.example.jpg" }
    trail_url { "www.example.com" }
    summary { "this is so ___!" }
    latitude { 12.3456 }
    longitude { -123.4567 }
  end
end
