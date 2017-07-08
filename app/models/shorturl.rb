class Shorturl < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :url
  before_create :generate_unique_string

  private

  def generate_unique_string
    unique_string = SecureRandom.hex(6)
    while Shorturl.find_by_short_url( unique_string ).present? do
      unique_string = SecureRandom.hex(6)
    end
    self.short_url = unique_string
  end
end
