class List < ApplicationRecord
  # has_many :bookmarks, dependent: :destroy
  # has_many :movies, through: :bookmarks, dependent: :destroy
  # has_many :reviews, dependent: :destroy
  # has_one_attached :photo
  # validates :name, uniqueness: true, presence: true

  validates :name, presence: true, uniqueness: true

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  before_destroy :destroy_associated_bookmarks

  private

  def destroy_associated_bookmarks
    bookmarks.destroy_all
  end
end
