class Image < ApplicationRecord
  include Hashid::Rails

  has_one_attached :file
  belongs_to :api_key
end
