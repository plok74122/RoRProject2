class Shorturl < ApplicationRecord
  validates_presence_of :url
end
