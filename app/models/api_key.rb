class ApiKey < ApplicationRecord
  encrypts :key, deterministic: true
end
