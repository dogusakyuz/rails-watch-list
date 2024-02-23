class Movie < ApplicationRecord
  # has_many :bookmarks
  # validates :title, presence: true, uniqueness: true
  # validates :overview, presence: true

  validates :title, :overview, presence: true
  validates :title, :overview, uniqueness: true

  has_many :bookmarks
  has_many :lists, through: :bookmarks
end
