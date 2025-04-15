class Todo < ApplicationRecord
  # title
  # description
  # completed

  validates :title, presence: true

  # validate length of title
  validates :title, length: { maximum: 200 }
end
