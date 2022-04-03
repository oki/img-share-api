
# bundle exec rails runner sandbox/test_image_share_api.rb

require "imgshare_api"

api = ImgshareApi.new(api_key: "foo")

# api.upload("./sandbox/1x1.png")
pp api.upload("./sandbox/test.png")