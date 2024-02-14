class City < ApplicationRecord
  has_many :cinemas
  validates :name, presence: true, uniqueness: {case_sensitive: false }
  before_save :capitalize_names

  def capitalize_names
    self.name = name.capitalize
  end
end
