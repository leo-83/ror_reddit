class Comment < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :body, :author, presence: true

end
